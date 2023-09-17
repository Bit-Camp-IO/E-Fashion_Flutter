import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tokens_state.dart';

@injectable
class TokensCubit extends Cubit<TokensState> {
  final CheckIfTokensExistUseCase _checkIfTokensExistUseCase;
  final DeleteTokensUseCase _deleteTokensUseCase;
  TokensCubit(this._checkIfTokensExistUseCase, this._deleteTokensUseCase) : super(TokensInitialState());

  void checkIfUserExist() {
    Future.delayed(
      Duration.zero,
      () {
        final response = _checkIfTokensExistUseCase();
        response.fold(
          (l) => emit(
            TokensUnAuthenticatedState(),
          ),
          (r) => emit(
            TokensAuthenticatedState(tokens: r),
          ),
        );
      },
    );
  }
  Future<void> deleteUserToken() async{
    emit(TokensLoadingState());
    await _deleteTokensUseCase();
    emit(TokensUnAuthenticatedState());
  }
}
