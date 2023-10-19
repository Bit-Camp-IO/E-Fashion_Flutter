import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String message;
  final String senderId;
  final String date;

  const ChatMessage({
    required this.message,
    required this.senderId,
    required this.date,
  });

  @override
  List<Object?> get props => [
        message,
        senderId,
        date,
      ];
}
