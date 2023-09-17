part of 'discover_cubit.dart';

class DiscoverState extends Equatable {
  final List<Product> products;
  final CubitState discoverState;
  final String discoverFailureMessage;
  final bool hasProductsListReachedMax;

  const DiscoverState({
    this.products = const [],
    this.discoverState = CubitState.initial,
    this.discoverFailureMessage = '',
    this.hasProductsListReachedMax = false,
  });

  DiscoverState copyWith({
    List<Product>? products,
    CubitState? discoverState,
    String? discoverFailureMessage,
    bool? hasProductsListReachedMax,
  }) {
    return DiscoverState(
      products: products ?? this.products,
      discoverState: discoverState ?? this.discoverState,
      discoverFailureMessage: discoverFailureMessage ?? this.discoverFailureMessage,
      hasProductsListReachedMax: hasProductsListReachedMax ?? this.hasProductsListReachedMax,
    );
  }

  @override
  List<Object?> get props => [
    products,
    discoverState,
    discoverFailureMessage,
    hasProductsListReachedMax,
  ];
}
