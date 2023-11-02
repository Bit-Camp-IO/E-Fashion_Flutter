import 'dart:async';
import 'package:efashion_flutter/components/chatSupportComponent/data/models/chat_message_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

abstract class ChatRemoteDataSource {
  Future<String> createOrJoinChat({required userAccessToken});

  Future<ChatMessageModel> sendMessage({required String message, required String chatId});

  Stream<ChatMessageModel> getChatStream();

  Future<void> closeSocketConnection();

  Future<List<ChatMessageModel>> getChatMessages({required chatId});
  @disposeMethod
  dispose();
}

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ChatRemoteDataSourceImpl(@Named(ApiConstants.authenticatedConsumer) this._apiConsumer);

  late IO.Socket socketConsumer;
  StreamController<ChatMessageModel> chatMessageController =
      StreamController<ChatMessageModel>.broadcast();

  @override
  Future<String> createOrJoinChat({required userAccessToken}) async {
    final response =
    await _apiConsumer.get(ApiConstants.getExistingChat);
    if (response['status'] == ApiCallStatus.success.value) {
      _connectToSocket(userAccessToken: userAccessToken, chatId: response['data']['id']);
      return response['data']['id'];
    } else {
      final getChatResponse =
      await _apiConsumer.post(ApiConstants.createNewChat);
      if (getChatResponse['status'] == ApiCallStatus.success.value) {
        _connectToSocket(userAccessToken: userAccessToken, chatId: getChatResponse['data']['id']);
        return getChatResponse['data']['id'];
      } else {
        throw const FetchDataException();
      }
    }
  }

  @override
  Future<List<ChatMessageModel>> getChatMessages({required chatId}) async{
    final response = await _apiConsumer.get(ApiConstants.getChatMessages(chatId: chatId));
    if(response['status'] == ApiCallStatus.success.value){
      final List messagesList = response['data'];
      if (messagesList.isNotEmpty) {
        return List<ChatMessageModel>.from((messagesList)
            .map((message) => ChatMessageModel.fromJson(message)));
      } else {
        return <ChatMessageModel>[];
      }
    }else{
      throw const FetchDataException();
    }
  }

  void _connectToSocket(
      {required userAccessToken, required String chatId}) async {
      socketConsumer = IO.io(ApiConstants.apiUrl, <String, dynamic>{
        'autoConnect': false,
        'transports': ['websocket'],
        'auth': {'token': userAccessToken},
        'query': {'chatId': chatId},
      });
      socketConsumer.connect();
      socketConsumer.on('new_message', (data) {
        final ChatMessageModel newMessage = ChatMessageModel(
            message: data['content'],
            isMe: false,
            date: data['date']);
        chatMessageController.sink.add(
          newMessage,
        ); // Add the message to the stream
      });
    socketConsumer.onError((data) => const FetchDataException());
  }

  @override
  Future<ChatMessageModel> sendMessage({required String message, required String chatId}) async{
    final response = await _apiConsumer.post(ApiConstants.sendNewMessage(chatId: chatId),
      body: {
        'content': message,
      }
    );
    if(response['status'] == ApiCallStatus.success.value){
      return ChatMessageModel.fromJson(response['data']);
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Stream<ChatMessageModel> getChatStream() {
    return chatMessageController.stream;
  }

  @override
  Future<void> closeSocketConnection() async{
    socketConsumer.clearListeners();
    socketConsumer.disconnect();
  }

  @override
  void dispose() async{
    await chatMessageController.close();
  }
}
