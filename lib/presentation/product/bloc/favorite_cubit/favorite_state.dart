part of 'favorite_cubit.dart';

class FavoriteState extends Equatable{
  final Set<String> favoriteList;
  const FavoriteState({
    this.favoriteList = const <String>{},
  });



  @override
  List<Object?> get props => [favoriteList];

  FavoriteState copyWith({
    Set<String>? favoriteList,
  }) {
    return FavoriteState(
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }
}
