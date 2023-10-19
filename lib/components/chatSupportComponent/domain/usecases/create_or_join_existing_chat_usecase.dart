import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateOrJoinChatUseCase{
  final ChatSupportRepository _supportChatRepository;
  const CreateOrJoinChatUseCase(this._supportChatRepository);

  Future<Either<Failure,List<ChatMessage>>> call({required String userAccessToken}) async{
    return await _supportChatRepository.createOrJoinChat(userAccessToken: userAccessToken);
  }
}