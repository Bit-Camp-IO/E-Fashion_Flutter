import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendMessageUseCase{
  final ChatSupportRepository _chatSupportRepository;
  const SendMessageUseCase(this._chatSupportRepository);

  Future<Either<Failure, ChatMessage>> call({
    required String message,
    required String chatId,
  }) async{
    return await _chatSupportRepository.sendMessage(message: message, chatId: chatId);
  }
}