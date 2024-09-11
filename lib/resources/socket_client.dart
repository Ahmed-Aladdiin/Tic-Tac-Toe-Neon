import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  Socket? socket;
  static final SocketClient _instance = SocketClient._internal();

  SocketClient._internal() {
    const server = 'Your-back-end-server';
    socket = io(server, <String, dynamic> {
      'transports': ['websocket'],
      'autoConnect': false
    });

    socket?.connect();
  }

  static SocketClient get instance => _instance;
  factory SocketClient() => _instance;
}