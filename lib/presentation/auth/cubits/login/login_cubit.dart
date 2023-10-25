import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/subscribe_to_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase _userLoginUseCase;
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final SubscribeToNotificationsUseCase _subscribeToNotificationsUseCase;
  late String userAccessToken;

  LoginCubit(
    this._userLoginUseCase,
    this._getUserAccessTokenUseCase,
    this._subscribeToNotificationsUseCase,
  ) : super(LoginInitialState());

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await _userLoginUseCase(
      email: email,
      password: password,
    );
    response.fold(
      (loginFail) => emit(LoginFailState(failMessage: loginFail.message)),
      (loginSuccess) async{
        await _subscribeToNotifications();
        emit(
          LoginSuccessState(authTokens: loginSuccess),
        );
      },
    );
  }

  Future _subscribeToNotifications() async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    debugPrint('TOKEN : $deviceToken');
    await _subscribeToNotificationsUseCase(
      userAccessToken: userAccessToken,
      deviceToken: deviceToken!,
    );
    debugPrint('>>>>>>>>>>>>>>>> SUBSCRIBED <<<<<<<<<<<<<<<<<');
  }
}
