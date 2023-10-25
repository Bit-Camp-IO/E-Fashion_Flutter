import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/unsubscribe_from_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tokens_state.dart';

@injectable
class TokensCubit extends Cubit<TokensState> {
  final CheckIfTokensExistUseCase _checkIfTokensExistUseCase;
  final DeleteTokensUseCase _deleteTokensUseCase;
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final UnSubscribeFromNotificationsUseCase
      _unSubscribeFromNotificationsUseCase;
  late String userAccessToken;

  TokensCubit(
    this._checkIfTokensExistUseCase,
    this._deleteTokensUseCase,
    this._getUserAccessTokenUseCase,
    this._unSubscribeFromNotificationsUseCase,
  ) : super(TokensInitialState());

  void checkIfUserExist() {
    Future.delayed(
      Duration.zero,
      () {
        final response = _checkIfTokensExistUseCase();
        response.fold(
          (l) => emit(
            TokensUnAuthenticatedState(),
          ),
          (r) => emit(
            TokensAuthenticatedState(tokens: r),
          ),
        );
      },
    );
  }

  Future<void> deleteUserToken() async {
    await _unSubscribeFromNotifications();
    emit(TokensLoadingState());
    await _deleteTokensUseCase();
    emit(TokensUnAuthenticatedState());
  }

  Future _unSubscribeFromNotifications() async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    await _unSubscribeFromNotificationsUseCase(
      userAccessToken: userAccessToken,
      deviceToken: deviceToken!,
    );
    debugPrint('>>>>>>>>>>>>>>>> UNSUBSCRIBED <<<<<<<<<<<<<<<<<');
  }
}
