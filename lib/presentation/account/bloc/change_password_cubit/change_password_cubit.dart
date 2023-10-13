import 'package:efashion_flutter/components/authComponent/domain/usecases/change_password_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final GetUserAccessTokenUseCase _getAccessTokenUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  late String userAccessToken;

  ChangePasswordCubit(this._getAccessTokenUseCase, this._changePasswordUseCase)
      : super(ChangePasswordInitial());

  Future<void> changePassword({
    required oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    final getAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _changePasswordUseCase(
        userAccessToken: userAccessToken,
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
      response.fold(
        (failure) => emit(
          ChangePasswordFailureState(message: failure.message),
        ),
        (successMessage) => emit(
          ChangePasswordSuccessState(message: successMessage),
        ),
      );
    } else {
      emit(const ChangePasswordFailureState(message: 'There Was an Error!'));
    }
  }
}
