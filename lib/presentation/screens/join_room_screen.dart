import 'package:flutter/material.dart';
import 'package:tictactoe/presentation/responsive/responsive.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/custom_field.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/resources/socket_methods.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});
  static const String route = '/join-room';

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController room = TextEditingController();

  @override
  void initState() {
    super.initState();
    SocketMethods.joinSuccessListener(context, 1);
    SocketMethods.joinErrorListener(context);
  }

  @override
  void dispose() {
    name.dispose();
    SocketMethods.disposeJoinSuccessListener();
    SocketMethods.disposeJoinErrorListener();
    super.dispose();
  }

  void joinRoom() {
    SocketMethods.joinRoom(name.text, room.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GlowingText(
                text: 'Join   Room',
                shadows: const [
                  Shadow(
                    blurRadius: 52,
                    color: Colors.blue,
                  ),
                ],
                size: 70,
              ),
              const SizedBox(height: 50),
              CustomField(
                controller: name,
                hint: 'Enter you Nickname',
              ),
              const SizedBox(height: 20),
              CustomField(
                controller: room,
                hint: 'Enter Game ID',
              ),
              const SizedBox(height: 20),
              CustomButton(onPressed: () => joinRoom(), label: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}
