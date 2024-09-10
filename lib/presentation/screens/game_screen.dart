import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/presentation/view/current_user_view.dart';
import 'package:tictactoe/presentation/view/game_view.dart';
import 'package:tictactoe/presentation/view/lobby_view.dart';
import 'package:tictactoe/presentation/view/score_board_view.dart';
import 'package:tictactoe/provider/room_provider.dart';
import 'package:tictactoe/resources/socket_methods.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  static const String route = '/game';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isJoinable = true;

  @override
  void initState() {
    super.initState();
    

    if (isJoinable) {
      SocketMethods.joinSuccessListener(context, 0);
    }

    SocketMethods.editTileListener(context);
    SocketMethods.roundWinListener(context);
    SocketMethods.gameEndListener(context);
    SocketMethods.tieListener(context);
  }

  @override
  void dispose() {
    SocketMethods.disposeJoinSuccessListener();
    SocketMethods.disposeEditTileListener();
    SocketMethods.disposeRoundWinListener();
    SocketMethods.disposeGameEndListener();
    SocketMethods.disposeTieListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isJoinable = Provider.of<RoomProvider>(context).roomDoc.isJoinable;
    final height = MediaQuery.sizeOf(context).height;
    // final roomDoc = Provider.of<RoomProvider>(context).roomDoc;
    return (isJoinable) ? const LobbyView() : Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              const ScoreBoardView(),
              SizedBox(height: height * 0.1),
              const GameView(),
              const CurrentUserView(),
            ],
          ),
        ),
      ),
    );
  }
}
