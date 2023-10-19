import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/chatSupportComponent/data/datasources/chat_remote_datasource.dart';
import 'package:efashion_flutter/components/chatSupportComponent/data/models/chat_message_model.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatSupportRepository)
class ChatSupportRepositoryImpl extends ChatSupportRepository{
  final ChatRemoteDataSource _chatRemoteDataSource;

  ChatSupportRepositoryImpl(this._chatRemoteDataSource);
  @override
  Future<Either<Failure, List<ChatMessageModel>>> createOrJoinChat({required userAccessToken}) async{
    try{
      final List<ChatMessageModel> chatMessages = await _chatRemoteDataSource.createOrJoinChat(userAccessToken: userAccessToken);
      return right(chatMessages);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  void sendMessage({required String message}) {
      _chatRemoteDataSource.sendMessage(message: message);
  }

  @override
  Stream<ChatMessageModel> getChatStream() {
    return _chatRemoteDataSource.getChatStream();
  }

  @override
  Future<void> closeSocketConnection() async{
    await _chatRemoteDataSource.closeSocketConnection();
  }
}