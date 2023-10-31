part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchForProductsEvent extends SearchEvent {
  final String searchQuery;
  const SearchForProductsEvent({required this.searchQuery});
  @override
  List<Object?> get props => [searchQuery];
}

class FilterSearchProductsEvent extends SearchEvent {
  final String? categories;
  final String? brands;
  final int? minPrice;
  final int? maxPrice;

  const FilterSearchProductsEvent({
    required this.categories,
    required this.brands,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  List<Object?> get props => [categories, brands, minPrice, maxPrice];


}

class LoadMoreSearchProductEvent extends SearchEvent {
  const LoadMoreSearchProductEvent();
  @override
  List<Object?> get props => [];
}
