part of 'tokens_cubit.dart';

abstract class TokensState extends Equatable {
  const TokensState();
  @override
  List<Object> get props => [];
}

class TokensInitialState extends TokensState {}

class TokensLoadingState extends TokensState {}

class TokensAuthenticatedState extends TokensState {


  const TokensAuthenticatedState();
  @override
  List<Object> get props => [];
}

class TokensUnAuthenticatedState extends TokensState {}
