part of 'chat_support_bloc.dart';

abstract class ChatSupportEvent extends Equatable {
  const ChatSupportEvent();
  @override
  List<Object?> get props => [];
}

class CreateOrJoinChatEvent extends ChatSupportEvent{}

class SendMessageEvent extends ChatSupportEvent{
  final String message;
  final String senderId;
  const SendMessageEvent( {required this.message, required this.senderId});
  @override
  List<Object?> get props => [message, senderId];
}

class MessageReceivedEvent extends ChatSupportEvent{
  final ChatMessage message;
  const MessageReceivedEvent({required this.message});
  @override
  List<Object?> get props => [message];
}