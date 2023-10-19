import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.message,
    required super.senderId,
    required super.date,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> jsonData) {
    return ChatMessageModel(
      message: jsonData['content'],
      senderId: jsonData['sender'],
      date: jsonData['createdAt'],
    );
  }
}
