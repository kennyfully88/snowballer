import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void endGame() {
      Navigator.pop(context);
    }

    final snowBallerGame = SnowballerGame(gameEnder: endGame);

    return PopScope(
      onPopInvoked: (didPop) => false,
      canPop: false,
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: SafeArea(
          child: GameWidget<SnowballerGame>(
            game: snowBallerGame,
          ),
        ),
      ),
    );
  }
}
