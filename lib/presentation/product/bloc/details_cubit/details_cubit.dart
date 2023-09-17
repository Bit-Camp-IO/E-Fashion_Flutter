import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/core/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  DetailsCubit(this._getProductDetailsUseCase) : super(const DetailsState());

  Future<void> getProductDetails({required String productId}) async {
    emit(state.copyWith(productDetailsState: CubitState.loading));
    final Either<Failure, ProductDetails> response =
    await _getProductDetailsUseCase(productId: productId);
    response.fold(
          (failure) => emit(
        state.copyWith(
          productDetailsFailMessage: failure.message,
          productDetailsState: CubitState.failure,
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
}
