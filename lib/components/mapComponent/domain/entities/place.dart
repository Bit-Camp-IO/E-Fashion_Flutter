import 'package:equatable/equatable.dart';

class Place extends Equatable{
  final String id;
  final String name;
  const Place({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
