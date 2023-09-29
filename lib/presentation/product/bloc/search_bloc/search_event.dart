part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchForProductsEvent extends SearchEvent{
  final String searchQuery;
  final String? categories;
  final String? brands;
  final int? genders;
  const SearchForProductsEvent({ required this.searchQuery, this.categories, this.brands, this.genders});
  @override
  List<Object?> get props => [searchQuery, categories, brands, genders];
}

class LoadMoreSearchProductEvent extends SearchEvent{

  const LoadMoreSearchProductEvent();
  @override
  List<Object?> get props => [];
}