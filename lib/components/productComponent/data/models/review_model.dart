import 'package:efashion_flutter/components/productComponent/data/models/reviewer_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.id,
    required super.reviewer,
    required super.comment,
    required super.rate,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
      id: jsonData['id'],
      reviewer: ReviewerModel.fromJson(jsonData['user']),
      comment: jsonData['comment'] ?? '',
      rate: jsonData['rate'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
    );
  }
}
