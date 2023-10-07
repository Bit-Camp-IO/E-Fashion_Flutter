import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviewer.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviews_and_rating.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final GetProductReviewsAndRatingsUseCase _getProductReviewsAndRatingsUseCase;
  final AddOrEditProductReviewUseCase _addOrEditProductReviewUseCase;
  final GetUserProductReviewUseCase _getUserProductReviewUseCase;
  final GetAccessTokenUseCase _getAccessTokenUseCase;
  late String userAccessToken;

  DetailsCubit(
    this._getProductDetailsUseCase,
    this._getProductReviewsAndRatingsUseCase,
    this._addOrEditProductReviewUseCase,
    this._getUserProductReviewUseCase,
    this._getAccessTokenUseCase,
  ) : super(const DetailsState());

  Future<void> getProductDetails({required String productId}) async {
    emit(state.copyWith(productDetailsState: CubitState.loading));
    final Either<Failure, ProductDetails> response =
        await _getProductDetailsUseCase(productId: productId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          productDetailsFailMessage: failure.message,
        ),
      ),
      (productDetails) => emit(
        state.copyWith(
          productDetails: productDetails,
          productDetailsState: CubitState.success,
        ),
      ),
    );
  }

  Future<void> getProductReviewsAndRatings({required String productId}) async {
    final Either<Failure, ReviewsAndRatings> response =
        await _getProductReviewsAndRatingsUseCase(productId: productId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          productDetailsFailMessage: failure.message,
          productDetailsState: CubitState.failure,
        ),
      ),
      (reviewsAndRatings) => emit(
        state.copyWith(
            reviewsAndRatings: reviewsAndRatings,
            reviewState: CubitState.success),
      ),
    );
  }

  Future<void> getUserProductReview({
    required String productId,
  }) async {
    final getAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final Either<Failure, Review> response =
          await _getUserProductReviewUseCase(
        productId: productId,
        userAccessToken: userAccessToken,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            reviewState: CubitState.failure,
            reviewFailMessage: failure.message,
          ),
        ),
        (review) {
          final reviewsList = state.reviewsAndRatings.reviews.toList();
          if (reviewsList.isNotEmpty) {
            reviewsList.removeAt(0);
            reviewsList.insert(0, review);
          } else {
            reviewsList.insert(0, review);
          }
          emit(
            state.copyWith(
              userReview: review,
              reviewsAndRatings:
                  state.reviewsAndRatings.copyWith(reviews: reviewsList),
              reviewState: CubitState.success,
            ),
          );
        },
      );
    }
  }

  Future<void> addOrEditProductReview({
    required String productId,
    required double rate,
    String? review,
  }) async {
    final getAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty && review != state.userReview.comment ||
        userAccessToken.isNotEmpty && rate != state.userReview.rate) {
      final Either<Failure, Review> response =
          await _addOrEditProductReviewUseCase(
        productId: productId,
        rate: rate,
        review: review,
        userAccessToken: userAccessToken,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            reviewState: CubitState.failure,
            reviewFailMessage: failure.message,
          ),
        ),
        (review) {
          getProductReviewsAndRatings(productId: productId);
          final reviewsList = state.reviewsAndRatings.reviews.toList();
          if (reviewsList.isNotEmpty) {
            reviewsList.removeAt(0);
            reviewsList.insert(0, review);
          } else {
            reviewsList.insert(0, review);
          }
          emit(
            state.copyWith(
                userReview: review,
                reviewsAndRatings:
                    state.reviewsAndRatings.copyWith(reviews: reviewsList),
                reviewState: CubitState.success),
          );
        },
      );
    }
  }
}
