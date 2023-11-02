import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/components/authComponent/data/models/tokens_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<TokensModel> userLogin({
    required String email,
    required String password,
  });

  Future<TokensModel> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<String> updateAccessToken({required String refreshToken});

  Future<String> forgetPassword({required String email});

  Future<void> verifyOtp({required String email, required String otpCode});

  Future<String> resetPassword(
      {required String email, required String otpCode, required newPassword});

  Future<String> changePassword({
    required String userAccessToken,
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthDataSourceImpl extends AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthDataSourceImpl(
      @Named(ApiConstants.unAuthenticatedConsumer) this._apiConsumer);

  @override
  Future<TokensModel> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await _apiConsumer.post(
      ApiConstants.authLoginEndPoint,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return TokensModel.fromJson(response);
    } else {
      throw const ServerException('Error! Wrong email or password.');
    }
  }

  @override
  Future<TokensModel> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final response = await _apiConsumer.post(
      ApiConstants.authSignUpEndPoint,
      body: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "confirmPassword": password,
        "phone": phoneNumber,
      },
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return TokensModel.fromJson(response);
    } else {
      throw const ServerException('Error! Invalid email address.');
    }
  }

  @override
  Future<String> updateAccessToken({required String refreshToken}) async {
    final newAccessToken =
        await _apiConsumer.get(ApiConstants.refreshAccessToken, headers: {
      'X-Refresh-Token': refreshToken,
    });
    if (newAccessToken['status'] == ApiCallStatus.success.value) {
      return newAccessToken['data']['accessToken'];
    } else {
      throw TokensException(newAccessToken['error']['message']);
    }
  }

  @override
  Future<String> forgetPassword({required String email}) async {
    final forgetPasswordRequest =
        await _apiConsumer.post(ApiConstants.forgetPasswordEndPoint, body: {
      'email': email,
    });
    if (forgetPasswordRequest['status'] == ApiCallStatus.success.value) {
      return "Success! OTP Code sent to your email.";
    } else {
      throw const NotFoundException("Error! Wrong Email Address.");
    }
  }

  @override
  Future<void> verifyOtp(
      {required String email, required String otpCode}) async {
    final verifyOtpRequest =
        await _apiConsumer.post(ApiConstants.verifyPasswordOtpEndPoint, body: {
      'email': email,
      'otp': otpCode,
    });
    if (verifyOtpRequest['status'] == ApiCallStatus.error.value ||
        verifyOtpRequest['data']['ok'] == false) {
      throw const NotFoundException("Error! Wrong OTP Code.");
    }
  }

  @override
  Future<String> resetPassword(
      {required String email,
      required String otpCode,
      required newPassword}) async {
    final resetPasswordRequest = await _apiConsumer.post(
      ApiConstants.resetPasswordEndPoint,
      body: {
        'email': email,
        'newPassword': newPassword,
        'otp': otpCode,
      },
    );
    if (resetPasswordRequest['status'] == ApiCallStatus.success.value &&
        resetPasswordRequest['message'] == "OK") {
      return "Password changed successfully! ";
    } else {
      throw const NotFoundException("Please choose a new password!");
    }
  }

  @override
  Future<String> changePassword({
    required String userAccessToken,
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    final changePasswordRequest = await _apiConsumer.patch(
      ApiConstants.changePasswordEndPoint,
      headers: {
        'Authorization': 'Bearer $userAccessToken',
      },
      body: {
        'oldPassword': oldPassword,
        'password': newPassword,
        'confirmNewPassword': confirmNewPassword
      },
    );
    if (changePasswordRequest['status'] == ApiCallStatus.success.value &&
        changePasswordRequest['message'] == "OK") {
      return "Password changed successfully! ";
    } else {
      throw const NotFoundException("Current Password Incorrect!");
    }
  }
}
