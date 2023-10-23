part of 'chat_support_bloc.dart';

abstract class ChatSupportEvent extends Equatable {
  const ChatSupportEvent();
  @override
  List<Object?> get props => [];
}

class CreateOrJoinChatEvent extends ChatSupportEvent{}

class GetChatMessagesEvent extends ChatSupportEvent{}

class SendMessageEvent extends ChatSupportEvent{
  final String message;
  const SendMessageEvent( {required this.message});
  @override
  List<Object?> get props => [message];
}

class MessageReceivedEvent extends ChatSupportEvent{
  final ChatMessage message;
  const MessageReceivedEvent({required this.message});
  @override
  List<Object?> get props => [message];
}