import 'package:equatable/equatable.dart';

class Brand extends Equatable{
  final String id;
  final String name;

  const Brand({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}