part of 'cart_cubit.dart';

class CartState extends Equatable {
  final Cart cart;
  final CubitState cartState;
  final String cartMessage;

  final int selectedQuantity;
  final String? selectedColor;
  final String? selectedSize;

  @override
  List<Object?> get props => [
        cart,
        cartState,
        cartMessage,
        selectedQuantity,
        selectedColor,
        selectedSize,
      ];

  const CartState({
    this.cart = const Cart(
      products: [],
      subTotal: 0,
      tax: 0,
      total: 0,
    ),
    this.cartState = CubitState.initial,
    this.cartMessage = '',
    this.selectedQuantity = 1,
    this.selectedColor,
    this.selectedSize,
  });

  CartState copyWith({
    Cart? cart,
    CubitState? cartState,
    String? cartMessage,
    int? selectedQuantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      cartState: cartState ?? this.cartState,
      cartMessage: cartMessage ?? this.cartMessage,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
