import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.profileImagePath,
    required super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      email: jsonData['email'],
      fullName: jsonData['fullName'],
      profileImagePath: jsonData['profile'],
      phoneNumber: jsonData['phoneNumber']
    );
  }
}
