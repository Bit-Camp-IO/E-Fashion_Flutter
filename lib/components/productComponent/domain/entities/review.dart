import 'package:efashion_flutter/components/productComponent/domain/entities/reviewer.dart';
import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final Reviewer reviewer;
  final String comment;
  final num rate;
  final String createdAt;
  final String updatedAt;

  const Review({
    required this.id,
    required this.reviewer,
    required this.comment,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, reviewer, comment, rate, createdAt, updatedAt];
}
