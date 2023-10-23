import 'dart:async';

import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/entities/chat_message.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/close_socket_connection.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/create_or_join_existing_chat_usecase.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/get_chat_messages_usecase.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/get_chat_stream_usecase.dart';
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/send_message_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'chat_support_event.dart';

part 'chat_support_state.dart';

@injectable
class ChatSupportBloc extends Bloc<ChatSupportEvent, ChatSupportState> {
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final CreateOrJoinChatUseCase _createOrJoinChatUseCase;
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetChatStreamUseCase _getChatStreamUseCase;
  final CloseSocketConnectionUseCase _closeSocketConnectionUseCase;
  late String userAccessToken;
  late StreamSubscription<ChatMessage> streamSubscription;
  bool hasSubscribedToStream = false;

  ChatSupportBloc(
    this._getUserAccessTokenUseCase,
    this._createOrJoinChatUseCase,
    this._getChatMessagesUseCase,
    this._sendMessageUseCase,
    this._getChatStreamUseCase,
    this._closeSocketConnectionUseCase,
  ) : super(const ChatSupportState()) {
    on<CreateOrJoinChatEvent>(_createOrJoinChatEvent);
    on<MessageReceivedEvent>(_messageReceivedEvent);
    on<SendMessageEvent>(_sendMessageEvent);
    on<GetChatMessagesEvent>(_getChatMessages);
  }

  Future<void> _createOrJoinChatEvent(
      CreateOrJoinChatEvent event, Emitter<ChatSupportState> emit) async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final response =
        await _createOrJoinChatUseCase(userAccessToken: userAccessToken);
    response.fold(
      (failure) => emit(
        state.copyWith(
          chatState: BlocState.failure,
        ),
      ),
      (chatId) {
        _startChatStreamSubscription();
        emit(
          state.copyWith(
            chatId: chatId,
            chatState: BlocState.success,
          ),
        );
        add(GetChatMessagesEvent());
      },
    );
  }

  void _getChatMessages(
      GetChatMessagesEvent event, Emitter<ChatSupportState> emit) async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final response = await _getChatMessagesUseCase(
        userAccessToken: userAccessToken, chatId: state.chatId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          chatMessagesState: BlocState.failure,
          chatFailMessage: failure.message,
        ),
      ),
      (chatMessages) => emit(
        state.copyWith(
          chatMessagesState: BlocState.success,
          chatMessages: chatMessages.reversed.toList(),
        ),
      ),
    );
  }

  void _sendMessageEvent(
      SendMessageEvent event, Emitter<ChatSupportState> emit) async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final response = await _sendMessageUseCase(
      message: event.message,
      chatId: state.chatId,
      userAccessToken: userAccessToken,
    );
    response.fold(
      (failure) => emit(
        state.copyWith(
          sendMessageState: BlocState.failure,
        ),
      ),
      (sentMessage) => emit(
        state.copyWith(
          sendMessageState: BlocState.success,
          chatMessages: [sentMessage, ...state.chatMessages],
        ),
      ),
    );
  }

  void _messageReceivedEvent(
      MessageReceivedEvent event, Emitter<ChatSupportState> emit) {
    emit(
      state.copyWith(
        chatMessages:  [event.message, ...state.chatMessages]
      ),
    );
  }

  void _startChatStreamSubscription() {
    streamSubscription = _getChatStreamUseCase().listen((newMessage) {
      add(MessageReceivedEvent(message: newMessage));
    });
  }

  @override
  Future<void> close() async {
    streamSubscription.cancel();
    await _closeSocketConnectionUseCase();
    return super.close();
  }
}
