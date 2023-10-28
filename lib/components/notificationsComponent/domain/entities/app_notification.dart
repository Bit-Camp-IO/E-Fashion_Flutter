import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  final String type;
  final String title;
  final String body;

  final String date;

  const AppNotification({
    required this.type,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  List<Object?> get props => [type, title, body, date];
}
