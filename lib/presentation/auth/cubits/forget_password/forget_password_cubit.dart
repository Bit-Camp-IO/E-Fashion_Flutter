import 'package:efashion_flutter/components/authComponent/domain/usecases/forget_password_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  late String email;
  late String otpCode;

  ForgetPasswordCubit(
    this._forgetPasswordUseCase,
    this._verifyOtpUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(const ForgetPasswordLoadingState());
    final forgetPasswordResponse = await _forgetPasswordUseCase(email: email);
    forgetPasswordResponse.fold(
      (failure) => emit(
        ForgetPasswordFailState(message: failure.message),
      ),
      (successMessage) {
        this.email = email;
        emit(
          ForgetPasswordSuccessState(message: successMessage),
        );
      },
    );
  }

  Future<void> verifyOtp({required String otpCode}) async {
    emit(const ForgetPasswordLoadingState());
    final forgetPasswordResponse = await _verifyOtpUseCase(email: email, otpCode: otpCode);
    forgetPasswordResponse.fold(
      (failure) => emit(
        VerifyOtpFailState(message: failure.message),
      ),
      (successMessage) {
        this.otpCode = otpCode;
        emit(
          const VerifyOtpSuccessState(),
        );
      },
    );
  }

  Future<void> resetPassword({required String newPassword}) async {
    emit(const ForgetPasswordLoadingState());
    final forgetPasswordResponse = await _resetPasswordUseCase(
      otpCode: otpCode,
      email: email,
      newPassword: newPassword,
    );
    forgetPasswordResponse.fold(
      (failure) => emit(
        ForgetPasswordFailState(message: failure.message),
      ),
      (successMessage) => emit(
        ResetPasswordSuccessState(message: successMessage),
      ),
    );
  }
}
