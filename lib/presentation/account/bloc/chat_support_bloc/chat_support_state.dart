part of 'chat_support_bloc.dart';

class ChatSupportState extends Equatable {
  final String chatId;
  final BlocState chatState;
  final String chatFailMessage;
  final List<ChatMessage> chatMessages;
  final BlocState chatMessagesState;
  final BlocState sendMessageState;

  const ChatSupportState({
    this.chatId = '',
    this.chatState = BlocState.initial,
    this.chatFailMessage = '',
    this.chatMessagesState = BlocState.initial,
    this.chatMessages = const [],
    this.sendMessageState = BlocState.initial,
  });

  @override
  List<Object> get props => [
        chatId,
        chatMessages,
        chatState,
        chatMessagesState,
        sendMessageState,
        chatFailMessage,
      ];

  ChatSupportState copyWith({
    String? chatId,
    BlocState? chatState,
    String? chatFailMessage,
    List<ChatMessage>? chatMessages,
    BlocState? chatMessagesState,
    BlocState? sendMessageState,
  }) {
    return ChatSupportState(
      chatId: chatId ?? this.chatId,
      chatState: chatState ?? this.chatState,
      chatFailMessage: chatFailMessage ?? this.chatFailMessage,
      chatMessages: chatMessages ?? this.chatMessages,
      chatMessagesState: chatMessagesState ?? this.chatMessagesState,
      sendMessageState: sendMessageState ?? this.sendMessageState,
    );
  }
}
