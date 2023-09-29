import 'package:efashion_flutter/components/productComponent/domain/entities/reviewer.dart';

class ReviewerModel extends Reviewer {
  const ReviewerModel({
    required super.id,
    required super.fullName,
    required super.profileImage,
  });

  factory ReviewerModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewerModel(
      id: jsonData['id'],
      fullName: jsonData['fullName'],
      profileImage: jsonData['profileImage'],
    );
  }
}
