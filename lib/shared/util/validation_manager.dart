import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/cupertino.dart';

class ValidationManager {
  static basicValidator({required String? label}) {
    return (value) {
      if (value!.isEmpty) {
        return '$label ${StringsManager.textIsRequired}';
      } else if (value.length < 8) {
        return '$label ${StringsManager.textIsTooShort}';
      }
      return null;
    };
  }

  static phoneNumberValidator({required TextEditingController phoneController,}){
    final phoneNumberRegex = RegExp(r'^\d{11}$');
    return  (value) {
      if (!phoneNumberRegex.hasMatch(value ?? '')) {
        return StringsManager.phoneNumberValidationMessage;
      } else {
        return null;
      }
    };
  }

  static emailValidator() {
    return (value) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      if (!emailRegex.hasMatch(value ?? '')) {
        return StringsManager.emailValidationMessage;
      }
      return null;
    };
  }

  static changePasswordValidator({
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) {
    return (value) {
      final lowercaseRegex = RegExp(r'[a-z]');
      final uppercaseRegex = RegExp(r'[A-Z]');
      final digitRegex = RegExp(r'[0-9]');
      if (value == null || value.isEmpty) {
        return StringsManager.passwordIsRequiredMessage;
      } else if (passwordController.text != confirmPasswordController.text &&
          confirmPasswordController.text.isNotEmpty) {
        return StringsManager.passwordNoMatch;
      } else if (value.length < 8) {
        return StringsManager.passwordTooShort;
      } else if (!lowercaseRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveLowerCaseLetter;
      } else if (!uppercaseRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveUpperCaseLetter;
      } else if (!digitRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveOneDigit;
      } else {
        return null;
      }
    };
  }
  static passwordValidator({
    required TextEditingController passwordController,
  }) {
    return (value) {
      final lowercaseRegex = RegExp(r'[a-z]');
      final uppercaseRegex = RegExp(r'[A-Z]');
      final digitRegex = RegExp(r'[0-9]');
      if (value == null || value.isEmpty) {
        return StringsManager.passwordIsRequiredMessage;
      } else if (value.length < 8) {
        return StringsManager.passwordTooShort;
      } else if (!lowercaseRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveLowerCaseLetter;
      } else if (!uppercaseRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveUpperCaseLetter;
      } else if (!digitRegex.hasMatch(value)) {
        return StringsManager.passwordMustHaveOneDigit;
      } else {
        return null;
      }
    };
  }

  static reviewValidator(){
    return (value) {
      if(value!.length < 20){
        return StringsManager.reviewValidationMessage;
      }else{
        return null;
      }
    };
  }
}
