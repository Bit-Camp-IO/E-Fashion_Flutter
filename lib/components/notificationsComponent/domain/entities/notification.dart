import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String type;
  final String title;
  final String body;

  final String date;

  const Notification({
    required this.type,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  List<Object?> get props => [type, title, body, date];
}
