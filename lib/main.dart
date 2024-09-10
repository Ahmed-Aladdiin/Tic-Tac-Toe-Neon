import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_provider.dart';
import 'package:tictactoe/presentation/screens/create_room_screen.dart';
import 'package:tictactoe/presentation/screens/game_screen.dart';
import 'package:tictactoe/presentation/screens/join_room_screen.dart';
import 'package:tictactoe/presentation/screens/main_menu_screen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
          GameScreen.route: (context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.route,
      ),
    );
  }
}
