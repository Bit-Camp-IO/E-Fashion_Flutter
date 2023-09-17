import 'package:equatable/equatable.dart';

class ProductColor extends Equatable{
  final String name;
  final String hex;

  const ProductColor({required this.name, required this.hex});
  @override
  List<Object?> get props => [name, hex];
}