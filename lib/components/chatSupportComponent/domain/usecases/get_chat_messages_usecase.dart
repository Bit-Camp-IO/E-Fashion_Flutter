import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetChatMessagesUseCase{
  final ChatSupportRepository _chatSupportRepository;

  const GetChatMessagesUseCase(this._chatSupportRepository);

  Future<Either<Failure, List<ChatMessage>>> call({required String chatId}) async {
    return await _chatSupportRepository.getChatMessages(chatId: chatId);
  }
}