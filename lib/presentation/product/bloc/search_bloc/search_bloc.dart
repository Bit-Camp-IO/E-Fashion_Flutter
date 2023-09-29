import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchForProductsUseCase _searchForProductsUseCase;
  String searchQuery = '';
  int searchPageNumber = 1;
  String? brands;
  int? genders;
  String? categories;
  SearchBloc(this._searchForProductsUseCase) : super(const SearchState()) {
    on<SearchForProductsEvent>(
      _searchForProductsEvent,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 700))
          .distinct()
          .switchMap(mapper),
    );
    on<LoadMoreSearchProductEvent>(_loadMoreProducts, transformer: droppable());
  }

  Future<void> _searchForProductsEvent(
      SearchForProductsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    if (event.searchQuery != searchQuery || event.genders != genders || event.categories != categories) {
      searchQuery = event.searchQuery;
      brands = event.brands;
      genders = event.genders;
      categories = event.categories;
      searchPageNumber = 1;
      final response = await _searchForProductsUseCase(
        pageNumber: searchPageNumber,
        searchQuery: event.searchQuery,
        brands: event.brands,
        gender: event.genders,
        categories: event.categories,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            searchState: BlocState.failure,
            searchFailMessage: failure.message,
          ),
        ),
        (searchProducts) {
          searchPageNumber++;
          emit(
            state.copyWith(
              hasSearchProductsListReachedMax:
                  searchProducts.length < 20 ? true : false,
              searchProducts: searchProducts,
              searchState: BlocState.success,
            ),
          );
        },
      );
    }
  }

  Future<void> _loadMoreProducts(
      LoadMoreSearchProductEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    if (!state.hasSearchProductsListReachedMax) {
      final response = await _searchForProductsUseCase(
        pageNumber: searchPageNumber,
        searchQuery: searchQuery,
        brands: brands,
        gender: genders,
        categories: categories,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            searchState: BlocState.failure,
            searchFailMessage: failure.message,
          ),
        ),
        (searchProducts) {
          if (searchProducts.isNotEmpty) {
            emit(
              state.copyWith(
                searchProducts: List.of(state.searchProducts)..addAll(searchProducts),
                searchState: BlocState.success,
              ),
            );
            searchPageNumber++;
          } else if (searchProducts.length < 20 || searchProducts.isEmpty) {
            emit(
              state.copyWith(
                hasSearchProductsListReachedMax: true,
                searchState: BlocState.success,
              ),
            );
          }
        },
      );
    }
  }
}
