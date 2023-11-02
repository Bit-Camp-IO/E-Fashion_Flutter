import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String? profileImagePath;
  final String phoneNumber;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.profileImagePath,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        fullName,
        profileImagePath,
        phoneNumber,
      ];

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    String? profileImagePath,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
