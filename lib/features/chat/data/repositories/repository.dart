import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomweb/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:randomweb/features/chat/data/datasources/socket_api.dart';

class Repository {
  Repository._private();

  static final Repository _instance = Repository._private();

  static get instance => _instance;

  final Socket _socket = SocketAPI.instance.socket;

  void makeConnection() {
    _socket.emit('make');
    print('Log : Connection Making......');
  }

  void sendMessage(String message) {
    print('Log : Messaging..........');
    _socket.emit('message', message);
  }

  void listen(BuildContext context) {
    print('Log : Listening..........');

    _socket.once('userDisconnected', (data) {
      _socket.clearListeners();
      BlocProvider.of<ChatBloc>(context).add(
        UserDisconnectedEvent(),
      );
    });

    _socket.once('userConnected', (data) {
      BlocProvider.of<ChatBloc>(context).add(
        UserConnectedEvent(),
      );
    });

    _socket.on('message', (message) {
      print('Log : Message Recieved......' + message);
      BlocProvider.of<ChatBloc>(context).add(MessageRecivedEvent(message));
    });
  }
}
