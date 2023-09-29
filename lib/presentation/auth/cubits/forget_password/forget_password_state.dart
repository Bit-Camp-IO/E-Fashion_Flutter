part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}

class ForgetPasswordFailState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordFailState({required this.message});
  @override
  List<Object> get props => [message];
}


class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();
}

class VerifyOtpSuccessState extends ForgetPasswordState {
  const VerifyOtpSuccessState();
}

class VerifyOtpFailState extends ForgetPasswordState {
  final String message;
  const VerifyOtpFailState({required this.message});
  @override
  List<Object> get props => [message];
}

class ResetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  const ResetPasswordSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}

class ResetPasswordFailState extends ForgetPasswordState {
  final String message;

  const ResetPasswordFailState({required this.message});
  @override
  List<Object> get props => [message];
}