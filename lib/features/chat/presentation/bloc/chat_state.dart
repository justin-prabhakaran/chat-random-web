part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatRecivedState extends ChatInitial {
  final List<String> messages;

  ChatRecivedState(this.messages);
}

class UserDisconnectedState extends ChatInitial {}

class UserConnectedState extends ChatInitial {}
