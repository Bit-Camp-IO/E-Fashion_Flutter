import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final UserSignUpUseCase _userSignUpUseCase;

  SignupCubit(this._userSignUpUseCase) : super(SignupInitialState());

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
      (fail) => emit(const SignupFailState(failMessage: 'There was an error, try again later.')),
      (success) => emit(
        SignupSuccessState(authTokens: success),
      ),
    );
  }
}
