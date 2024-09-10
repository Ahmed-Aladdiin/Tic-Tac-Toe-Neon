class Player {
  String nickname;
  String socketId;
  String character;
  int points;
  String id;

  Player({
    required this.nickname,
    required this.socketId,
    required this.character,
    required this.points,
    required this.id,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        nickname: json["nickname"],
        socketId: json["socketID"],
        character: json["character"],
        points: json["points"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "socketID": socketId,
        "character": character,
        "points": points,
        "_id": id,
      };

  @override
  String toString() {
    return 'Player(nickname: $nickname, socketId: $socketId, character: $character, points: $points, id: $id)';
  }
}
