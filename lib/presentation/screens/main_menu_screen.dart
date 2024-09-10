import 'package:flutter/material.dart';
import 'package:tictactoe/presentation/responsive/responsive.dart';
import 'package:tictactoe/presentation/screens/create_room_screen.dart';
import 'package:tictactoe/presentation/screens/join_room_screen.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});
  static const String route = '/';

  toCreateRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.route);
  }

  toJoinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GlowingText(
                text: 'Tic',
                shadows: const [Shadow(blurRadius: 52, color: Colors.blue)],
                size: 80,
              ),
              GlowingText(
                text: 'Tac   Toe',
                shadows: const [Shadow(blurRadius: 52, color: Colors.red)],
                size: 80,
              ),
              const SizedBox(height: 70),
              CustomButton(
                  onPressed: () => toCreateRoom(context),
                  label: 'Create a Room'),
              const SizedBox(height: 20),
              CustomButton(
                  onPressed: () => toJoinRoom(context), label: 'Join a Room'),
            ],
          ),
        ),
      ),
    );
  }
}
