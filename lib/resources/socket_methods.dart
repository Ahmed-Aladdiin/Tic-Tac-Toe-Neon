import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/player_model.dart';
import 'package:tictactoe/model/room_model.dart';
import 'package:tictactoe/provider/room_provider.dart';
import 'package:tictactoe/presentation/screens/game_screen.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/utils/utils.dart';

abstract class SocketMethods {
  static final _socket = SocketClient().socket!;

  // Emitters
  static void createRoom(String nickname) {
    _socket.emit('create-room', {'nickname': nickname});
  }

  static void joinRoom(String nickname, String roomID) {
    _socket.emit('join-room', {'nickname': nickname, 'roomID': roomID});
  }

  static void tapTile(int index, BuildContext context) {
    final roomProvider = Provider.of<RoomProvider>(context, listen: false);
    _socket.emit('tap-tile', {
      'index': index,
      'char': roomProvider.current.character,
      'gameBoard': roomProvider.gameBoard,
      'roomID': roomProvider.roomDoc.id
    });
  }

  // Listeners
  // 1
  static void createSuccessListener(BuildContext context) {
    void listener(roomDoc) {
      final room = Room.fromJson(roomDoc);
      Provider.of<RoomProvider>(context, listen: false).updateRoom(room);

      Navigator.pushReplacementNamed(context, GameScreen.route);
    }

    _socket.on('create-room-success', listener);
  }

  static void disposeCreateSuccessListener() {
    _socket.off('create-room-success');
  }

  // 2
  static void joinSuccessListener(BuildContext context, int playerIndex) {
    void listener(roomDoc) {
      final room = Room.fromJson(roomDoc);
      final roomProvider = Provider.of<RoomProvider>(context, listen: false);
      roomProvider.updateRoom(room);
      roomProvider.setPlayers(playerIndex);
      roomProvider.resetBoard();
      roomProvider.resetCurrentPlayer();

      if (playerIndex == 1) {
        Navigator.pushReplacementNamed(context, GameScreen.route);
      }
    }

    _socket.on('join-room-success', listener);
  }

  static void disposeJoinSuccessListener() {
    _socket.off('join-room-success');
  }

  static void joinErrorListener(BuildContext context) {
    void listener(message) {
      final msg = message.toString();

      showSnackBar(context, msg);
    }

    _socket.on('join-error', listener);
  }

  static void disposeJoinErrorListener() {
    _socket.off('join-error');
  }

  static void editTileListener(BuildContext context) {
    void listener(message) {
      final index = (message['index'] as int);
      final char = (message['char'] as String);
      final roomProvider = Provider.of<RoomProvider>(context, listen: false);
      roomProvider.setTile(index, char);
      roomProvider.toggleCurrentPlayerIndex();
    }

    _socket.on('edit-tile', listener);
  }

  static void disposeEditTileListener() {
    _socket.off('edit-tile');
  }

  static void roundWinListener(BuildContext context) {
    void listener(map) {
      final room = Room.fromJson(map['roomDoc']);
      final winner = Player.fromJson(map['winner']);
      final roomProvider = Provider.of<RoomProvider>(context, listen: false);
      roomProvider.updateRoom(room);
      roomProvider.resetBoard();
      showWinner(context, winner, 'Round');
    }

    _socket.on('round-win', listener);
  }

  static void disposeRoundWinListener() {
    _socket.off('round-win');
  }

  static void gameEndListener(BuildContext context) {
    void listener(winnerDoc) {
      final winner = Player.fromJson(winnerDoc);
      showWinner(context, winner, 'Game');
    }

    _socket.on('game-end', listener);
  }

  static void disposeGameEndListener() {
    _socket.off('game-end');
  }

  static void tieListener(BuildContext context) {
    void listener(_) {
      final roomProvider = Provider.of<RoomProvider>(context, listen: false);
      roomProvider.resetBoard();
      showWinner(context, null, 'Tie');
    }

    _socket.on('tie', listener);
  }

  static void disposeTieListener() {
    _socket.off('tie');
  }
}
