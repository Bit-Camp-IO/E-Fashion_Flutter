part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Product> searchProducts;
  final bool hasSearchProductsListReachedMax;
  final BlocState searchState;
  final String searchFailMessage;
  final BlocState loadMoreProductsState;
  const SearchState({
    this.searchProducts = const [],
    this.hasSearchProductsListReachedMax = false,
    this.searchState = BlocState.initial,
    this.searchFailMessage = '',
    this.loadMoreProductsState = BlocState.initial
  });

  @override
  List<Object?> get props => [
        searchProducts,
        hasSearchProductsListReachedMax,
        searchState,
        searchFailMessage,
        loadMoreProductsState,
      ];

  SearchState copyWith({
    List<Product>? searchProducts,
    bool? hasSearchProductsListReachedMax,
    BlocState? searchState,
    String? searchFailMessage,
    BlocState? loadMoreProductsState,
  }) {
    return SearchState(
      searchProducts: searchProducts ?? this.searchProducts,
      hasSearchProductsListReachedMax:
          hasSearchProductsListReachedMax ?? this.hasSearchProductsListReachedMax,
      searchState: searchState ?? this.searchState,
      searchFailMessage: searchFailMessage ?? this.searchFailMessage,
      loadMoreProductsState: loadMoreProductsState ?? this.loadMoreProductsState,
    );
  }
}
