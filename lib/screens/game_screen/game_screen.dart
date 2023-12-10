import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';
import 'package:snowballer/providers/game_logic.dart';
import 'package:snowballer/providers/settings.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void endGame() {
      Navigator.pop(context);
    }

    final snowBallerGame = SnowballerGame(
      gameEnder: endGame,
      context: context,
    );

    return DefaultTextStyle(
      style: context.watch<Settings>().defaultFont,
      child: PopScope(
        onPopInvoked: (didPop) => false,
        canPop: false,
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: SafeArea(
            child: Stack(
              children: [
                GameWidget<SnowballerGame>(
                  game: snowBallerGame,
                ),
                const CoinCounter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoinCounter extends StatelessWidget {
  const CoinCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 4,
      top: 4,
      child: Text(
        'Coins: ${context.watch<GameLogic>().coins}',
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
