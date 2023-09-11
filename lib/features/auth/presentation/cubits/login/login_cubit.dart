import 'package:efashion_flutter/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase _userLoginUseCase;

  LoginCubit(this._userLoginUseCase) : super(LoginInitialState());

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
      (loginSuccess) => emit(
        LoginSuccessState(authTokens: loginSuccess),
      ),
    );
  }
}
