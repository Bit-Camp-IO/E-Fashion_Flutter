import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final GetUserFavoriteProductsIdsUseCase _getUserFavoriteProductsIdsUseCase;
  final AddProductToFavoriteListUseCase _addProductToFavoriteListUseCase;
  final RemoveProductFromFavoriteListUseCase
      _removeProductFromFavoriteListUseCase;
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final GetFavoriteProductsUseCase _getFavoriteProductsUseCase;

  FavoriteCubit(
    this._getUserFavoriteProductsIdsUseCase,
    this._addProductToFavoriteListUseCase,
    this._removeProductFromFavoriteListUseCase,
    this._getProductDetailsUseCase,
    this._getFavoriteProductsUseCase,
  ) : super(const FavoriteState());

  Future<void> getUserFavoriteIdList() async {
    emit(state.copyWith(favoriteListState: CubitState.loading));
      final response = await _getUserFavoriteProductsIdsUseCase();
      response.fold(
        (failure) => emit(
          state.copyWith(
            favoriteListState: CubitState.failure,
          ),
        ),
        (favoriteIds) {
          emit(
            state.copyWith(favoritesIds: favoriteIds),
          );
          _getFavoriteProductsList();
        },
      );
  }

  Future<void> addOrRemoveProductFromFavoriteListEvent({required String productId}) async {
      if (state.favoritesIds.contains(productId)) {
        final response = await _removeProductFromFavoriteListUseCase(productId: productId);
        response.fold(
          (failure) => emit(state.copyWith(addOrRemoveFromFavoriteFailMessage: failure.message)),
          (removeMessage) => _removeFavoriteFromSetAndList(productId: productId),
        );
      } else {
        final response = await _addProductToFavoriteListUseCase(
          productId: productId,
        );
        response.fold(
            (failure) => emit(state.copyWith(addOrRemoveFromFavoriteFailMessage: failure.message)),
            (favoriteIdsList) {
          emit(
            state.copyWith(favoritesIds: favoriteIdsList),
          );
          _addFavoriteToList(productId: productId);
        });
      }
  }

  Future<void> _getFavoriteProductsList() async {
    final Either<Failure, List<ProductDetails>> favoriteProducts =
        await _getFavoriteProductsUseCase(
      favoriteIds: state.favoritesIds,
    );
    favoriteProducts.fold(
      (failure) => emit(
        state.copyWith(
          favoriteListState: CubitState.failure,
          favoriteListFailMessage: failure.message,
        ),
      ),
      (favoriteList) => emit(
        state.copyWith(
          favoriteList: favoriteList,
          favoriteListState: CubitState.success,
        ),
      ),
    );
  }

  Future<void> _removeFavoriteFromSetAndList(
      {required String productId}) async {
    final Set<String> favoriteIdList = state.favoritesIds.toSet();
    favoriteIdList.remove(productId);
    emit(state.copyWith(favoritesIds: favoriteIdList));
    final List<ProductDetails> favoriteList = state.favoriteList.toList();
    favoriteList.removeWhere((element) => element.id == productId);
    emit(state.copyWith(favoriteList: favoriteList));
  }

  Future<void> _addFavoriteToList({required String productId}) async {
    final List<ProductDetails> favoriteList = state.favoriteList.toList();
    final productDetails =
        await _getProductDetailsUseCase(productId: productId);
    productDetails.fold(
      (l) => null,
      (product) => emit(
        state.copyWith(
          favoriteList: List.from(favoriteList)..add(product),
        ),
      ),
    );
  }
}
