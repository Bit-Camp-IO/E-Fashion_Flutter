import 'package:flutter/cupertino.dart';

class ValidationManager {
  static basicValidator({required String? label}) {
    return (value) {
      if (value!.isEmpty) {
        return '$label is required';
      } else if (value.length < 8) {
        return '$label is too short';
      }
      return null;
    };
  }

  static phoneNumberValidator({required TextEditingController phoneController,}){
    final phoneNumberRegex = RegExp(r'^\+\d{12}$');
    return  (value) {
      if (!phoneNumberRegex.hasMatch(value ?? '')) {
        return 'Invalid Phone Number ex: +21045678910';
      } else {
        return null;
      }
    };
  }

  static emailValidator() {
    return (value) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      if (!emailRegex.hasMatch(value ?? '')) {
        return 'Not a valid email address';
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
        return 'Password is required';
      } else if (passwordController.text != confirmPasswordController.text &&
          confirmPasswordController.text.isNotEmpty) {
        return "Passwords don't match";
      } else if (value.length < 8) {
        return 'Password is too short (minimum 8 chars)';
      } else if (!lowercaseRegex.hasMatch(value)) {
        return 'Password must contain one lowercase letter';
      } else if (!uppercaseRegex.hasMatch(value)) {
        return 'Password must contain one uppercase letter';
      } else if (!digitRegex.hasMatch(value)) {
        return 'Password must contain one digit';
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
        return 'Password is required';
      } else if (value.length < 8) {
        return 'Password is too short (minimum 8 chars)';
      } else if (!lowercaseRegex.hasMatch(value)) {
        return 'Password must contain one lowercase letter';
      } else if (!uppercaseRegex.hasMatch(value)) {
        return 'Password must contain one uppercase letter';
      } else if (!digitRegex.hasMatch(value)) {
        return 'Password must contain one digit';
      } else {
        return null;
      }
    };
  }
}
