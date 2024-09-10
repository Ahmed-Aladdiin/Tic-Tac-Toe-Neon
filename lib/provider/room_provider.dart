import 'package:flutter/material.dart';
import 'package:tictactoe/model/player_model.dart';
import 'package:tictactoe/model/room_model.dart';

class RoomProvider with ChangeNotifier {
  Room? _room;
  int? _meIndex;
  int? _foeIndex;
  int _currentPlayerIndex = 0;

  List<String> _gameBoard = ['', '', '', '', '', '', '', '', ''];

  void updateRoom(Room roomDoc) {
    _room = roomDoc;
    notifyListeners();
  }

  void setPlayers(int myIndex) {
    _meIndex = myIndex;
    _foeIndex = 1 - myIndex;
    notifyListeners();
  }

  void setTile(int index, String char) {
    _gameBoard[index] = char;
    notifyListeners();
  }

  void resetBoard() {
    _gameBoard = ['', '', '', '', '', '', '', '', ''];
    notifyListeners();
  }

  void toggleCurrentPlayerIndex() {
    _currentPlayerIndex = 1 - _currentPlayerIndex;
    notifyListeners();
  }

  void resetCurrentPlayer() {
    _currentPlayerIndex = 0;
    notifyListeners();
  }

  Room get roomDoc => _room!;
  Player get me => _room!.players[_meIndex!];
  Player get foe => _room!.players[_foeIndex!];
  Player get current => _room!.players[_currentPlayerIndex];
  int get currentPlayerIndex => _currentPlayerIndex;
  List<String> get gameBoard => _gameBoard;
}
