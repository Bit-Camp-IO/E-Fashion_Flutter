import 'package:equatable/equatable.dart';

class Reviewer extends Equatable{
  final String id;
  final String fullName;
  final String? profileImage;

  const Reviewer({required this.id, required this.fullName, required this.profileImage});

  @override
  List<Object?> get props => [id, fullName, profileImage];
}