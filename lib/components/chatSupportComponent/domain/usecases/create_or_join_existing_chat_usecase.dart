import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateOrJoinChatUseCase{
  final ChatSupportRepository _supportChatRepository;
  const CreateOrJoinChatUseCase(this._supportChatRepository);

  Future<Either<Failure, String>> call({required String userAccessToken}) async{
    return await _supportChatRepository.createOrJoinChat(userAccessToken: userAccessToken);
  }
}