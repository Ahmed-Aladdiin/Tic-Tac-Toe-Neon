import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/presentation/widgets/glowing_text.dart';
import 'package:tictactoe/provider/room_provider.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/utils/utils.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600, maxHeight: width),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, ind) {
          return BoardTile(index: ind);
        },
      ),
    );
  }
}

class BoardTile extends StatelessWidget {
  const BoardTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final roomProvider = Provider.of<RoomProvider>(context);
    final char = roomProvider.gameBoard[index];
    return InkWell(
      onTap: () {
        if (char != '' || roomProvider.current != roomProvider.me) return;
        SocketMethods.tapTile(index, context);
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white24)),
        width: 70,
        height: 70,
        child: Center(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: GlowingText(
              text: char,
              shadows: [
                Shadow(blurRadius: 18, color: getCharacterColor(char)),
              ],
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
