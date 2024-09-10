// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

import 'package:tictactoe/model/player_model.dart';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  int occupancy;
  bool isJoinable;
  int maxRounds;
  int currentRound;
  int playerIndex;
  String id;
  List<Player> players;
  Player turn;
  int v;

  Room({
    required this.occupancy,
    required this.isJoinable,
    required this.maxRounds,
    required this.currentRound,
    required this.playerIndex,
    required this.id,
    required this.players,
    required this.turn,
    required this.v,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        occupancy: json["occupancy"],
        isJoinable: json["isJoinable"],
        maxRounds: json["maxRounds"],
        currentRound: json["currentRound"],
        playerIndex: json["playerIndex"],
        id: json["_id"],
        players: List<Player>.from(
          json["players"].map(
            (x) => Player.fromJson(x),
          ),
        ),
        turn: Player.fromJson(json["turn"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "occupancy": occupancy,
        "isJoinable": isJoinable,
        "maxRounds": maxRounds,
        "currentRound": currentRound,
        "playerIndex": playerIndex,
        "_id": id,
        "players": List<dynamic>.from(
          players.map(
            (x) => x.toJson(),
          ),
        ),
        "turn": turn.toJson(),
        "__v": v,
      };

	@override
	String toString() {
		return 'Room(occupancy: $occupancy, isJoinable: $isJoinable, maxRounds: $maxRounds, currentRound: $currentRound, playerIndex: $playerIndex, id: $id, players: $players, turn: $turn, v: $v)';
	}
}
