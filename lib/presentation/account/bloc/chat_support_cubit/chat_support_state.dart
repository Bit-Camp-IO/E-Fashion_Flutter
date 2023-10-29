part of 'chat_support_cubit.dart';

class ChatSupportState extends Equatable {
  final String chatId;
  final CubitState chatState;
  final String chatFailMessage;
  final List<ChatMessage> chatMessages;
  final CubitState chatMessagesState;
  final CubitState sendMessageState;

  const ChatSupportState({
    this.chatId = '',
    this.chatState = CubitState.initial,
    this.chatFailMessage = '',
    this.chatMessagesState = CubitState.initial,
    this.chatMessages = const [],
    this.sendMessageState = CubitState.initial,
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
    CubitState? chatState,
    String? chatFailMessage,
    List<ChatMessage>? chatMessages,
    CubitState? chatMessagesState,
    CubitState? sendMessageState,
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
