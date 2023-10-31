import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final UserSignUpUseCase _userSignUpUseCase;
  final NotificationsCubit _notificationsCubit;
  late String userAccessToken;

  SignupCubit(
    this._userSignUpUseCase,
    this._notificationsCubit,
  ) : super(SignupInitialState());

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(SignupLoadingState());
    final response = await _userSignUpUseCase(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    response.fold(
      (fail) => emit(SignupFailState(failMessage: fail.message)),
      (success) async {
        await _notificationsCubit.subscribeToNotifications();
        emit(
          SignupSuccessState(authTokens: success),
        );
      },
    );
  }
}
