import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendMessageUseCase{
  final ChatSupportRepository _chatSupportRepository;
  const SendMessageUseCase(this._chatSupportRepository);

  void call({required String message}){
    return _chatSupportRepository.sendMessage(message: message);
  }
}