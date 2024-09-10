import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_provider.dart';

class CurrentUserView extends StatefulWidget {
  const CurrentUserView({super.key});

  @override
  State<CurrentUserView> createState() => _CurrentUserViewState();
}

class _CurrentUserViewState extends State<CurrentUserView> {
  @override
  Widget build(BuildContext context) {
    final currentPlayer = Provider.of<RoomProvider>(context).current;
    return Expanded(
      child: Center(
        child: Text('${currentPlayer.nickname.toUpperCase()}\'s turn'),
      ),
    );
  }
}
