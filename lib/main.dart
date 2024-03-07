import 'package:flutter/material.dart';
import 'package:randomweb/features/chat/data/datasources/socket_api.dart';
import 'package:randomweb/features/chat/presentation/pages/chat_page.dart';

import 'features/chat/presentation/pages/home_page.dart';

void main() {
  // SocketAPI.instance.createConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Random Chat',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const ChatPage(),
    );
  }
}
