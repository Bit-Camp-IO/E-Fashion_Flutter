import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.fullName,
    required super.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      email: jsonData['email'],
      fullName: jsonData['fullName'],
      profileImage: jsonData['profile'],
    );
  }
}
