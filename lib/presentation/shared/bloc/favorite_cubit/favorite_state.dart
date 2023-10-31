part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final Set<String> favoritesIds;
  final List<ProductDetails> favoriteList;
  final CubitState favoriteListState;
  final String favoriteListFailMessage;
  final String addOrRemoveFromFavoriteFailMessage;

  const FavoriteState({
    this.favoritesIds = const <String>{},
    this.favoriteList = const <ProductDetails>[],
    this.favoriteListState = CubitState.initial,
    this.favoriteListFailMessage = '',
    this.addOrRemoveFromFavoriteFailMessage = '',
  });

  @override
  List<Object?> get props => [
        favoritesIds,
        favoriteList,
        favoriteListState,
        favoriteListFailMessage,
        addOrRemoveFromFavoriteFailMessage,
      ];

  FavoriteState copyWith({
    Set<String>? favoritesIds,
    List<ProductDetails>? favoriteList,
    CubitState? favoriteListState,
    String? favoriteListFailMessage,
    String? addOrRemoveFromFavoriteFailMessage,
  }) {
    return FavoriteState(
      favoritesIds: favoritesIds ?? this.favoritesIds,
      favoriteList: favoriteList ?? this.favoriteList,
      favoriteListState: favoriteListState ?? this.favoriteListState,
      favoriteListFailMessage: favoriteListFailMessage ?? this.favoriteListFailMessage,
      addOrRemoveFromFavoriteFailMessage: addOrRemoveFromFavoriteFailMessage ?? this.addOrRemoveFromFavoriteFailMessage
    );
  }
}
