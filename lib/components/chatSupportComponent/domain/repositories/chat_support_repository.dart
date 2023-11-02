import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class ChatSupportRepository {
  Future<Either<Failure, String>> createOrJoinChat({
    required userAccessToken,
  });

  Future<Either<Failure, ChatMessage>> sendMessage({
    required String message,
    required String chatId,
  });

  Future<Either<Failure, List<ChatMessage>>> getChatMessages({
    required String chatId,
});

  Stream<ChatMessage> getChatStream();

  Future<void> closeSocketConnection();
}
