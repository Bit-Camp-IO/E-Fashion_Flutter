part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Category> categories;
  final BlocState categoriesState;
  final String categoriesFailureMessage;
  final List<Product> productsOffers;
  final BlocState offersState;
  final String offersFailureMessage;
  final List<Brand> brands;
  final String brandsFailureMessage;
  final Map<String, List<Product>> brandsProducts;
  final BlocState brandsProductsState;
  final String brandsProductsFailureMessage;

  const HomeState({
    this.categories = const [],
    this.categoriesState = BlocState.initial,
    this.categoriesFailureMessage = '',
    this.productsOffers = const [],
    this.offersState = BlocState.initial,
    this.offersFailureMessage = '',
    this.brands = const [],
    this.brandsFailureMessage = '',
    this.brandsProducts = const {},
    this.brandsProductsState = BlocState.initial,
    this.brandsProductsFailureMessage = '',
  });

  @override
  List<Object> get props => [
        categories,
        categoriesState,
        categoriesFailureMessage,
        productsOffers,
        offersState,
        offersFailureMessage,
        brands,
        brandsFailureMessage,
        brandsProducts,
        brandsProductsState,
        brandsFailureMessage,
      ];

  HomeState copyWith({
    List<Category>? categories,
    BlocState? categoriesState,
    String? categoriesFailureMessage,
    List<Product>? productsOffers,
    BlocState? offersState,
    String? offersFailureMessage,
    List<Brand>? brands,
    String? brandsFailureMessage,
    Map<String, List<Product>>? brandsProducts,
    BlocState? brandsProductsState,
    String? brandsProductsFailureMessage,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesFailureMessage: categoriesFailureMessage ?? this.categoriesFailureMessage,
      productsOffers: productsOffers ?? this.productsOffers,
      offersState: offersState ?? this.offersState,
      offersFailureMessage: offersFailureMessage ?? this.offersFailureMessage,
      brands: brands ?? this.brands,
      brandsFailureMessage: brandsFailureMessage ?? this.brandsFailureMessage,
      brandsProducts: brandsProducts ?? this.brandsProducts,
      brandsProductsState: brandsProductsState ?? this.brandsProductsState,
      brandsProductsFailureMessage: brandsProductsFailureMessage ?? this.brandsProductsFailureMessage,
    );
  }
}
