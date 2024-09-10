import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  Socket? socket;
  static final SocketClient _instance = SocketClient._internal();

  SocketClient._internal() {
    const server = 'https://tic-tac-toe-cross.azurewebsites.net/';
    socket = io(server, <String, dynamic> {
      'transports': ['websocket'],
      'autoConnect': false
    });

    socket?.connect();
  }

  static SocketClient get instance => _instance;
  factory SocketClient() => _instance;
}