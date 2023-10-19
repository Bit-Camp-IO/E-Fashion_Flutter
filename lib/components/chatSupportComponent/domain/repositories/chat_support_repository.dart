import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class ChatSupportRepository {
  Future<Either<Failure, List<ChatMessage>>> createOrJoinChat({
    required userAccessToken,
  });
  void sendMessage({required String message});
  Stream<ChatMessage> getChatStream();
  Future<void> closeSocketConnection();
}
