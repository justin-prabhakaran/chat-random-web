import 'package:socket_io_client/socket_io_client.dart';

class SocketAPI {
  Socket? _socket;

  SocketAPI._();

  static final SocketAPI _instance = SocketAPI._();

  static SocketAPI get instance => _instance;
  Socket get socket {
    if (_socket == null) {
      print("Creating new instance of socketapi");
      _socket = io(
        "http://localhost:3000",
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      );
    }

    return _socket!;
  }

  void createConnection() {
    _instance.socket.connect();
    _instance.socket.onAny((event, data) => print("$event | $data"));
  }
}
