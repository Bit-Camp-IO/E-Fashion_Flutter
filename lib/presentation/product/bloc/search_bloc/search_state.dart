part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Product> searchProducts;
  final bool hasSearchProductsListReachedMax;
  final BlocState searchState;
  final String searchFailMessage;

  const SearchState({
    this.searchProducts = const [],
    this.hasSearchProductsListReachedMax = false,
    this.searchState = BlocState.initial,
    this.searchFailMessage = '',
  });

  @override
  List<Object?> get props => [
        searchProducts,
        hasSearchProductsListReachedMax,
        searchState,
        searchFailMessage,
      ];

  SearchState copyWith({
    List<Product>? searchProducts,
    bool? hasSearchProductsListReachedMax,
    BlocState? searchState,
    String? searchFailMessage,
  }) {
    return SearchState(
      searchProducts: searchProducts ?? this.searchProducts,
      hasSearchProductsListReachedMax:
          hasSearchProductsListReachedMax ?? this.hasSearchProductsListReachedMax,
      searchState: searchState ?? this.searchState,
      searchFailMessage: searchFailMessage ?? this.searchFailMessage,
    );
  }
}
