part of 'details_cubit.dart';

class DetailsState extends Equatable {
  final ProductDetails productDetails;
  final CubitState productDetailsState;
  final String productDetailsFailMessage;
  final ReviewsAndRatings reviewsAndRatings;
  final CubitState reviewState;
  final String reviewFailMessage;
  final Review userReview;
  final User userData;

  const DetailsState({
    this.productDetails = const ProductDetails(
      id: '',
      description: '',
      images: [],
      price: 0,
      colors: [],
      sizes: [],
      title: '',
      stock: 0,
    ),
    this.productDetailsState = CubitState.initial,
    this.productDetailsFailMessage = '',
    this.reviewsAndRatings =
        const ReviewsAndRatings(reviews: [], average: 0, rateCount: {}),
    this.reviewState = CubitState.initial,
    this.reviewFailMessage = '',
    this.userReview = const Review(
      rate: 0,
      comment: '',
      createdAt: '',
      id: '',
      reviewer: Reviewer(
        id: '',
        fullName: '',
        profileImage: '',
      ),
      updatedAt: '',
    ),
    this.userData = const User(
      profileImage: '',
      fullName: '',
      email: '',
    )
  });

  @override
  List<Object?> get props => [
        productDetailsState,
        productDetails,
        productDetailsFailMessage,
        reviewsAndRatings,
        reviewState,
        reviewFailMessage,
        userReview,
        userData,
      ];

  DetailsState copyWith({
    ProductDetails? productDetails,
    CubitState? productDetailsState,
    String? productDetailsFailMessage,
    ReviewsAndRatings? reviewsAndRatings,
    CubitState? reviewState,
    String? reviewFailMessage,
    Review? userReview,
    User? userData,
  }) {
    return DetailsState(
      productDetails: productDetails ?? this.productDetails,
      productDetailsState: productDetailsState ?? this.productDetailsState,
      productDetailsFailMessage:
          productDetailsFailMessage ?? this.productDetailsFailMessage,
      reviewsAndRatings: reviewsAndRatings ?? this.reviewsAndRatings,
      reviewState: reviewState ?? this.reviewState,
      reviewFailMessage: reviewFailMessage ?? this.reviewFailMessage,
      userReview: userReview ?? this.userReview,
      userData: userData ?? this.userData,
    );
  }
}
