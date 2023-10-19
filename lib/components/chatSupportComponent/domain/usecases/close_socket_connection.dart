import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CloseSocketConnectionUseCase{
  final ChatSupportRepository _chatSupportRepository;
  const CloseSocketConnectionUseCase(this._chatSupportRepository);

  Future<void> call() async{
    _chatSupportRepository.closeSocketConnection();
  }
}