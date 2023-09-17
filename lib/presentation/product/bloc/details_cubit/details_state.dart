part of 'details_cubit.dart';

class DetailsState extends Equatable {
  final ProductDetails productDetails;
  final CubitState productDetailsState;
  final String productDetailsFailMessage;

  const DetailsState({
    this.productDetails = const ProductDetails(
      id: '',
      description: '',
      images: [],
      price: 0,
      colors: [],
      sizes: [],
      title: '',
    ),
    this.productDetailsState = CubitState.initial,
    this.productDetailsFailMessage = '',
  });

  @override
  List<Object?> get props => [
        productDetailsState,
        productDetails,
        productDetailsFailMessage,
      ];

  DetailsState copyWith({
    ProductDetails? productDetails,
    CubitState? productDetailsState,
    String? productDetailsFailMessage,
  }) {
    return DetailsState(
      productDetails: productDetails ?? this.productDetails,
      productDetailsState: productDetailsState ?? this.productDetailsState,
      productDetailsFailMessage:
          productDetailsFailMessage ?? this.productDetailsFailMessage,
    );
  }
}
