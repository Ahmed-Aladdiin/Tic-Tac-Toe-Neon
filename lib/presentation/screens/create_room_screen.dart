import 'package:flutter/material.dart';
import 'package:tictactoe/presentation/responsive/responsive.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/custom_field.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/resources/socket_methods.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});
  static const String route = '/create-room';

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController room = TextEditingController();


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
                text: 'Create Room',
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
                controller: room,
                hint: 'Enter your Nickname',
              ),
              const SizedBox(height: 20),
              CustomButton(onPressed: () => createRoom(), label: 'Create')
            ],
          ),
        ),
      ),
    );
  }
}
