part of 'cart_cubit.dart';

class CartState extends Equatable {
  final Cart cart;
  final CubitState cartState;
  final String cartMessage;
  final int selectedQuantity;
  final String? selectedColor;
  final String? selectedSize;

  final String paymentClientSecret;
  final CubitState paymentState;

  final String paymentMessage;

  @override
  List<Object?> get props => [
        cart,
        cartState,
        cartMessage,
        selectedQuantity,
        selectedColor,
        selectedSize,
        paymentState,
        paymentMessage,
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
    this.paymentClientSecret = '',
    this.paymentState = CubitState.initial,
    this.paymentMessage = '',
  });

  CartState copyWith({
    Cart? cart,
    CubitState? cartState,
    String? cartMessage,
    int? selectedQuantity,
    String? selectedColor,
    String? selectedSize,
    String? paymentClientSecret,
    CubitState? paymentState,
    String? paymentMessage,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      cartState: cartState ?? this.cartState,
      cartMessage: cartMessage ?? this.cartMessage,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
      paymentClientSecret: paymentClientSecret ?? this.paymentClientSecret,
      paymentState: paymentState ?? this.paymentState,
      paymentMessage: paymentMessage ?? this.paymentMessage,
    );
  }
}
