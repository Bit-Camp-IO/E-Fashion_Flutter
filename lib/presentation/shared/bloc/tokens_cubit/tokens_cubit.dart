import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tokens_state.dart';

@injectable
class TokensCubit extends Cubit<TokensState> {
  final CheckIfTokensExistUseCase _checkIfTokensExistUseCase;
  final DeleteTokensUseCase _deleteTokensUseCase;

  late String userAccessToken;

  final NotificationsCubit _notificationsCubit;

  TokensCubit(
    this._checkIfTokensExistUseCase,
    this._deleteTokensUseCase,
    this._notificationsCubit,
  ) : super(TokensInitialState());

  void checkIfUserExist() {
    Future.delayed(
      Duration.zero,
      () {
        final isUserLoggedIn = _checkIfTokensExistUseCase();
        if(isUserLoggedIn){
          emit(
            const TokensAuthenticatedState(),
          );

        }else{
          emit(
            TokensUnAuthenticatedState(),
          );
        }
      },
    );
  }

  Future<void> deleteUserToken() async {
    await _notificationsCubit.unSubscribeFromNotifications();
    emit(TokensLoadingState());
    await _deleteTokensUseCase();
    emit(TokensUnAuthenticatedState());
  }
}
