import 'package:equatable/equatable.dart';

class Collection extends Equatable {
  final String id;
  final String title;
  final String description;
  final int price;
  final int discount;
  final String image;

  const Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discount,
        image,
      ];
}
