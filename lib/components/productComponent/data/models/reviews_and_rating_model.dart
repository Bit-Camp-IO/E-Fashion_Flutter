import 'package:efashion_flutter/components/productComponent/data/models/review_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviews_and_rating.dart';

class ReviewsAndRatingsModel extends ReviewsAndRatings {
  const ReviewsAndRatingsModel({
    required super.average,
    required super.rateCount,
    required super.reviews,
  });

  factory ReviewsAndRatingsModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewsAndRatingsModel(
      average: jsonData['average'],
      rateCount: (jsonData['rateCount']),
      reviews: List<ReviewModel>.from((jsonData['reviews'] as List).map((review) => ReviewModel.fromJson(review))),
    );
  }
}
