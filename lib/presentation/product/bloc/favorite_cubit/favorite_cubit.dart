import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_list_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final GetAccessTokenUseCase _getAccessTokenUseCase;
  final GetUserFavoriteListUseCase _getUserFavoriteListUseCase;
  final AddProductToFavoriteListUseCase _addProductToFavoriteListUseCase;
  final RemoveProductFromFavoriteListUseCase
      _removeProductFromFavoriteListUseCase;
  late String userAccessToken;

  FavoriteCubit(
    this._getAccessTokenUseCase,
    this._getUserFavoriteListUseCase,
    this._addProductToFavoriteListUseCase,
    this._removeProductFromFavoriteListUseCase,
  ) : super(const FavoriteState());

  Future<void> getUserFavoriteListEvent() async {
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response =
          await _getUserFavoriteListUseCase(userAccessToken: userAccessToken);
      response.fold(
        (failure) => debugPrint('>>>>>>>>> ${failure.message} <<<<<<<<<<<'),
        (favoriteList) => emit(
          state.copyWith(favoriteList: favoriteList),
        ),
      );
    }
  }


  Future<void> addOrRemoveProductFromFavoriteListEvent({required String productId}) async {
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      if (state.favoriteList.contains(productId)) {
        final response = await _removeProductFromFavoriteListUseCase(
            productId: productId, userAccessToken: userAccessToken);
        response.fold(
          (failure) => debugPrint('>>>>>>>>> ${failure.message} <<<<<<<<<<<'),
          (r) {
            final Set<String> favoriteList = state.favoriteList.toSet();
            favoriteList.remove(r);
            emit(state.copyWith(favoriteList: favoriteList));
          },
        );
      } else {
        final response = await _addProductToFavoriteListUseCase(
            productId: productId, userAccessToken: userAccessToken);
        response.fold(
          (failure) => debugPrint('>>>>>>>>> ${failure.message} <<<<<<<<<<<'),
          (favoriteList) => emit(
            state.copyWith(favoriteList: favoriteList),
          ),
        );
      }
    }
  }
}
