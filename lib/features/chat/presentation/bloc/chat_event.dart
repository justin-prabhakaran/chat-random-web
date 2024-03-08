part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class UserDisconnectedEvent extends ChatEvent {}

class UserConnectedEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent(this.message);
}

class MessageRecivedEvent extends ChatEvent {
  final String message;
  const MessageRecivedEvent(this.message);
}
