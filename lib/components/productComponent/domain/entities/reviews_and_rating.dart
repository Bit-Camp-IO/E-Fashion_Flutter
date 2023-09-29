import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:equatable/equatable.dart';

class ReviewsAndRatings extends Equatable {
  final num average;
  final Map<String, dynamic> rateCount;
  final List<Review> reviews;

  const ReviewsAndRatings({
    required this.average,
    required this.rateCount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [average, rateCount, reviews];

  ReviewsAndRatings copyWith({
    num? average,
    Map<String, dynamic>? rateCount,
    List<Review>? reviews,
  }) {
    return ReviewsAndRatings(
      average: average ?? this.average,
      rateCount: rateCount ?? this.rateCount,
      reviews: reviews ?? this.reviews,
    );
  }
}
