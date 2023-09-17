import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/core/util/enums.dart';
import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsOffersUseCase _getProductsOffersUseCase;
  final GetBrandsUseCase _getBrandsUseCase;
  final GetAllBrandsProductsUseCase _getBrandsProductsUseCase;

  late String userAccessToken;
  String? categories;
  HomeBloc(
    this._getCategoriesUseCase,
    this._getProductsOffersUseCase,
    this._getBrandsUseCase,
    this._getBrandsProductsUseCase,
  ) : super(const HomeState()) {
    on<GetCategoriesEvent>(
      _getCategoriesEvent,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 700))
          .distinct()
          .switchMap(mapper),
    );
    on<GetProductOffersEvent>(_getProductOffersEvent);
    on<GetBrandsEvent>(_getBrandsEvent);
    on<GetBrandsProductsEvent>(_getBrandsProductsEvent);
  }

  Future<void> _getCategoriesEvent(GetCategoriesEvent event, emit) async {
    final Either<Failure, List<Category>> response =
        await _getCategoriesUseCase(genderId: event.genderId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          categoriesFailureMessage: failure.message,
          categoriesState: BlocState.failure,
        ),
      ),
      (categoriesList) => emit(state.copyWith(
          categories: categoriesList, categoriesState: BlocState.success)),
    );
  }

  Future<void> _getProductOffersEvent(GetProductOffersEvent event, emit) async {
    categories = event.categories;
    final Either<Failure, List<Product>> response =
        await _getProductsOffersUseCase(categories: event.categories);
    response.fold(
      (failure) => emit(
        state.copyWith(
          offersFailureMessage: failure.message,
          offersState: BlocState.failure,
        ),
      ),
      (productOffers) => emit(state.copyWith(
          productsOffers: productOffers, offersState: BlocState.success)),
    );
  }

  Future<void> _getBrandsEvent(GetBrandsEvent event, emit) async {
    final Either<Failure, List<Brand>> response = await _getBrandsUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          brandsFailureMessage: failure.message,
        ),
      ),
      (brands) => emit(
        state.copyWith(
          brands: brands,
        ),
      ),
    );
  }

  Future<void> _getBrandsProductsEvent(
      GetBrandsProductsEvent event, emit) async {
    categories = event.categories;
    final Either<Failure, List<Brand>> brandsResponse =
        await _getBrandsUseCase();
    emit(
        state.copyWith(brands: brandsResponse.getOrElse(() => <BrandModel>[])));
    final Either<Failure, Map<String, List<Product>>> brandsProductsResponse =
        await _getBrandsProductsUseCase(
            brandsList: state.brands, categories: event.categories);
    brandsProductsResponse.fold(
      (failure) => emit(
        state.copyWith(
          brandsProductsFailureMessage: failure.message,
          brandsProductsState: BlocState.failure,
        ),
      ),
      (brandsProducts) => emit(
        state.copyWith(
          brandsProducts: brandsProducts,
          brandsProductsState: BlocState.success,
        ),
      ),
    );
  }
}
