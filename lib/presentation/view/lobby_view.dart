import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/presentation/responsive/responsive.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/provider/room_provider.dart';

class LobbyView extends StatelessWidget {
  const LobbyView({super.key});
  static const String route = '/create-room';

  void _copy(String roomID) {
    final data = ClipboardData(text: roomID);
    Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    final roomID = Provider.of<RoomProvider>(context).roomDoc.id;

    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GlowingText(
                text: 'Waiting Lobby',
                shadows: const [
                  Shadow(
                    blurRadius: 52,
                    color: Colors.blue,
                  ),
                ],
                size: 70,
              ),
              const SizedBox(height: 50),
              GlowingText(
                text: 'Room ID:',
                shadows: const [
                  Shadow(
                    blurRadius: 52,
                    color: Colors.blue,
                  ),
                ],
                size: 40,
              ),
              Text(
                roomID,
                style: const TextStyle(fontSize: 27),
              ),
              const SizedBox(height: 20),
              CustomButton(onPressed: () => _copy(roomID), label: 'Copy')
            ],
          ),
        ),
      ),
    );
  }
}
