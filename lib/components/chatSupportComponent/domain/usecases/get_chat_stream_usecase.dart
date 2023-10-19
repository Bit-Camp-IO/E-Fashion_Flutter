import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetChatStreamUseCase{
  final ChatSupportRepository _chatSupportRepository;

  GetChatStreamUseCase(this._chatSupportRepository);

  Stream<ChatMessage> call(){
    return _chatSupportRepository.getChatStream();
  }
}