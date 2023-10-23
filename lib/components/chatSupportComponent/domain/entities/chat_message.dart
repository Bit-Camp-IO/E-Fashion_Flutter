import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String message;
  final bool isMe;
  final String date;

  const ChatMessage({
    required this.message,
    required this.isMe,
    required this.date,
  });

  @override
  List<Object?> get props => [
        message,
        isMe,
        date,
      ];
}
