import 'package:flutter/material.dart';
import 'package:tictactoe/model/player_model.dart';
import 'package:tictactoe/presentation/screens/main_menu_screen.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/utils/colors.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Color getCharacterColor(String char) {
  return char == 'X' ? Colors.blue : const Color.fromRGBO(244, 67, 54, 1);
}

Future<void> showWinner(BuildContext context, Player? winner, String type) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      final action = (type == "Game")? 'Exit': (type == "Tie")? "Retry" : "Continue";
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 27, 21, 63),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              if (type == 'Game') {
                Navigator.pushNamedAndRemoveUntil(
                  context, MainMenuScreen.route, (_) => false);
              } else {
                Navigator.pop(context);
              }
            },
            child: Text(action, style: const TextStyle(fontSize: 35)),
          ),
        ],
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GlowingText(
                text: (winner != null)? winner.nickname.toUpperCase(): type,
                shadows: [
                  Shadow(
                    blurRadius: 15,
                    color: winner != null ? getCharacterColor( winner.character): bgColor,
                  ),
                ],
                size: 70,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              if (winner != null) GlowingText(
                text: 'Won the $type',
                shadows: const [
                  Shadow(
                    blurRadius: 15,
                    color: Colors.white30,
                  ),
                ],
                size: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}
