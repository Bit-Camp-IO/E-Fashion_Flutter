import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase _userLoginUseCase;
  final NotificationsCubit _notificationsCubit;
  late String userAccessToken;

  LoginCubit(
    this._userLoginUseCase,
    this._notificationsCubit,
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
      (loginSuccess) async {
        await _notificationsCubit.subscribeToNotifications();
        emit(
          LoginSuccessState(authTokens: loginSuccess),
        );
      },
    );
  }
}
