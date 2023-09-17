import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String id;
  final String name;
  final String imageUrl;
  final int gender;

  const Category({required this.id, required this.name, required this.imageUrl, required this.gender});
  @override
  List<Object?> get props => [id, name, imageUrl, gender];

}