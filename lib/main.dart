import 'package:flutter/material.dart';
import 'package:tictactoe/presentation/screens/create_room_screen.dart';
import 'package:tictactoe/presentation/screens/join_room_screen.dart';
import 'package:tictactoe/presentation/screens/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic-Tac-Teo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          MainMenuScreen.route: (context) => const MainMenuScreen(),
          CreateRoomScreen.route: (context) => const CreateRoomScreen(),
          JoinRoomScreen.route: (context) => const JoinRoomScreen(),
        },
        initialRoute: MainMenuScreen.route,
      ),
    );
  }
}
