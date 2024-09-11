# Tic-Tac-Toe Neon

**Tic-Tac-Toe Neon** is a cross-platform, multiplayer, online version of the classic Tic-Tac-Toe game, built using Flutter. With a striking neon theme, this game offers a fresh, modern look and a seamless experience for all players.

## Features

- **Cross-Platform Compatibility**: Enjoy the game on both Android, iOS devices, and even Web.
- **Online Multiplayer**: Play with friends or other players online by creating or joining game rooms using a unique Room ID.
- **Multiple Rounds**: Each game consists of 5 rounds. The player who wins the most rounds wins the game. Ties are not counted.
- **Smooth Gameplay**: Built using Socket.IO to ensure a seamless connection and smooth gameplay experience.
- **State Management**: Uses the Provider package for efficient state management.

## Getting Started

### Prerequisites

- Flutter SDK installed (version 3.24.0 or above)
- Dart SDK installed
- An IDE such as VS Code or Android Studio

### Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Ahmed-Aladdiin/Tic-Tac-Toe-Neon.git
    cd tic-tac-toe-neon
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```

### How to Play

1. **Create or Join a Room**:
   - Select "Create Room" to start a new game with a nickname.
   - Select "Join Room" and enter a Nickname and a Room ID to join an existing game.

2. **Gameplay**:
   - The game will start once both players are in the room.
   - Play through 5 rounds of Tic-Tac-Toe.
   - The player who wins the most rounds is declared the winner. Ties are not counted.

## Screenshots

<p align="center">
  <img src="./demo/demo_1.jpg" height="700" />
  <img src="./demo/demo_2.jpg" height="700" />
  <img src="./demo/demo_3.jpg" height="700" />
  <img src="./demo/demo_4.jpg" height="700" />
  <img src="./demo/demo_5.jpg" height="700" />
  <img src="./demo/demo_6.jpg" height="700" />
</p>

## Technologies Used

- **Flutter**: For building the cross-platform app.
- **Socket.IO**: For real-time, multiplayer functionality.
- **Provider**: For state management.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.
