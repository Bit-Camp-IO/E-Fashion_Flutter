part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final Set<String> favoritesIds;
  final List<ProductDetails> favoriteList;
  final CubitState favoriteListState;
  final String favoriteListFailMessage;

  const FavoriteState({
    this.favoritesIds = const <String>{},
    this.favoriteList = const <ProductDetails>[],
    this.favoriteListState = CubitState.initial,
    this.favoriteListFailMessage = '',
  });

  @override
  List<Object?> get props => [
        favoritesIds,
        favoriteList,
        favoriteListState,
        favoriteListFailMessage,
      ];

  FavoriteState copyWith({
    Set<String>? favoritesIds,
    List<ProductDetails>? favoriteList,
    CubitState? favoriteListState,
    String? favoriteListFailMessage,
  }) {
    return FavoriteState(
      favoritesIds: favoritesIds ?? this.favoritesIds,
      favoriteList: favoriteList ?? this.favoriteList,
      favoriteListState: favoriteListState ?? this.favoriteListState,
      favoriteListFailMessage:
          favoriteListFailMessage ?? this.favoriteListFailMessage,
    );
  }
}
