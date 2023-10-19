part of 'chat_support_bloc.dart';

class ChatSupportState extends Equatable {
  final List<ChatMessage> chatMessages;
  final BlocState chatState;
  final String chatFailMessage;

  final BlocState sendMessageState;

  const ChatSupportState({
    this.chatMessages = const [],
    this.chatState = BlocState.initial,
    this.sendMessageState = BlocState.initial,
    this.chatFailMessage = '',
  });

  @override
  List<Object> get props => [
        chatMessages,
        chatState,
        sendMessageState,
        chatFailMessage,
      ];

  ChatSupportState copyWith({
    List<ChatMessage>? chatMessages,
    BlocState? chatState,
    BlocState? sendMessageState,
    String? chatFailMessage,
  }) {
    return ChatSupportState(
      chatMessages: chatMessages ?? this.chatMessages,
      chatState: chatState ?? this.chatState,
      sendMessageState: sendMessageState ?? this.sendMessageState,
      chatFailMessage: chatFailMessage ?? this.chatFailMessage,
    );
  }
}
