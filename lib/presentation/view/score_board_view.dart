import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/player_model.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/provider/room_provider.dart';
import 'package:tictactoe/utils/utils.dart';

class ScoreBoardView extends StatefulWidget {
  const ScoreBoardView({super.key});

  @override
  State<ScoreBoardView> createState() => _ScoreBoardViewState();
}

class _ScoreBoardViewState extends State<ScoreBoardView> {
  @override
  void initState() {
    super.initState();
    // TODO: listen to the winner event
  }

  @override
  void dispose() {
    // TODO: dispose of the winner event
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final me = Provider.of<RoomProvider>(context).me;
    final foe = Provider.of<RoomProvider>(context).foe;
    final width = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlayerScore(player: me),
        SizedBox(width: width * 0.3),
        PlayerScore(player: foe)
      ],
    );
  }
}

class PlayerScore extends StatelessWidget {
  const PlayerScore({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GlowingText(
          text: player.nickname.toUpperCase(),
          shadows: [
            Shadow(
              blurRadius: 5,
              color: getCharacterColor(player.character),
            ),
          ],
          size: 18,
        ),
        const SizedBox(height: 8),
        Text(
          player.points.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
