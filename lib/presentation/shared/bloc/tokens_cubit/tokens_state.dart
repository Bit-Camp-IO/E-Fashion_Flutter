part of 'tokens_cubit.dart';

abstract class TokensState extends Equatable {
  const TokensState();
  @override
  List<Object> get props => [];
}

class TokensInitialState extends TokensState {}

class TokensLoadingState extends TokensState {}

class TokensAuthenticatedState extends TokensState {
  final Tokens tokens;

  const TokensAuthenticatedState({required this.tokens});
  @override
  List<Object> get props => [tokens];
}

class TokensUnAuthenticatedState extends TokensState {}
