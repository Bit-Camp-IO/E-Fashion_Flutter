import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String email;
  final String fullName;
  final String? profileImage;

  const User({required this.email, required this.fullName, required this.profileImage});
  @override
  List<Object?> get props => [email, fullName, profileImage];

}