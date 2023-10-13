part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {

}

class ChangePasswordLoadingState extends ChangePasswordState{}

class ChangePasswordFailureState extends ChangePasswordState{
  final String message;

  const ChangePasswordFailureState({required this.message});

  @override
  List<Object> get props => [message];

}

class ChangePasswordSuccessState extends ChangePasswordState{
  final String message;

  const ChangePasswordSuccessState({required this.message});

  @override
  List<Object> get props => [message];

}