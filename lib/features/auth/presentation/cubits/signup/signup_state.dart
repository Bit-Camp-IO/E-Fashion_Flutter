part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object> get props => [];
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupFailState extends SignupState {
  final String failMessage;
  const SignupFailState({required this.failMessage});
  @override
  List<Object> get props => [failMessage];
}

class SignupSuccessState extends SignupState {
  final Tokens authTokens;
  const SignupSuccessState({required this.authTokens});
  @override
  List<Object> get props => [authTokens];

}