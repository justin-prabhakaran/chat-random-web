import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomweb/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:randomweb/features/chat/data/datasources/socket_api.dart';

class Repository {
  final Socket _socket = SocketAPI.instance.socket;

  void makeConnection() {
    _socket.emit('make');
  }

  void sendMessage(String message) {
    _socket.emit('message', message);
  }

  void listen(BuildContext context) {
    _socket.on('userDisconnected', (data) {
      BlocProvider.of<ChatBloc>(context).add(
        UserDisconnectedEvent(),
      );
    });

    _socket.on('userConnected', (data) {
      BlocProvider.of<ChatBloc>(context).add(
        UserConnectedEvent(),
      );
    });

    _socket.on('message', (message) {
      BlocProvider.of<ChatBloc>(context).add(message);
    });
  }
}
