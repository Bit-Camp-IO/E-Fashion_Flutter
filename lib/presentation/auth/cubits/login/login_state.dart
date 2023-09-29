part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState  {}

class LoginLoadingState extends LoginState  {}

class LoginFailState extends LoginState  {
  final String failMessage;
  const LoginFailState({required this.failMessage});
  @override
  List<Object> get props => [failMessage];
}

class LoginSuccessState extends LoginState  {
  final Tokens authTokens;
  const LoginSuccessState({required this.authTokens});
  @override
  List<Object> get props => [authTokens];
}
