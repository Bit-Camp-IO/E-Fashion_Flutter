import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/subscribe_to_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final UserSignUpUseCase _userSignUpUseCase;
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final SubscribeToNotificationsUseCase _subscribeToNotificationsUseCase;
  late String userAccessToken;

  SignupCubit(
    this._userSignUpUseCase,
    this._getUserAccessTokenUseCase,
    this._subscribeToNotificationsUseCase,
  ) : super(SignupInitialState());

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignupLoadingState());
    final response = await _userSignUpUseCase(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    response.fold(
      (fail) => emit(SignupFailState(failMessage: fail.message)),
      (success) async{
        await _subscribeToNotifications();
        emit(
          SignupSuccessState(authTokens: success),
        );
      },
    );
  }

  Future _subscribeToNotifications() async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    await _subscribeToNotificationsUseCase(
      userAccessToken: userAccessToken,
      deviceToken: deviceToken!,
    );
    debugPrint('>>>>>>>>>>>>>>>> SUBSCRIBED <<<<<<<<<<<<<<<<<');
  }
}
