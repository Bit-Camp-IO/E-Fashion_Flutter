import 'package:equatable/equatable.dart';

class CartOrder extends Equatable {
  final String id;
  final int totalPrice;
  final int totalQuantity;
  final int status;

  const CartOrder({
    required this.id,
    required this.totalPrice,
    required this.totalQuantity,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        totalPrice,
        totalQuantity,
        status,
      ];
}
