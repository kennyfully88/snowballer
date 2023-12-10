import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';
import 'package:snowballer/providers/game_logic.dart';
import 'package:snowballer/providers/settings.dart';
import 'package:snowballer/screens/ending_screen/ending_screen.dart';

GlobalKey gameScreenKey = GlobalKey();

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void endGame() {
      Navigator.pop(context);
    }

    void showEnding() {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const EndingScreen();
          },
        ),
      );
    }

    final snowBallerGame = SnowballerGame(
      gameEnder: endGame,
      goodEnding: showEnding,
    );

    return DefaultTextStyle(
      style: context.watch<Settings>().defaultFont,
      child: PopScope(
        onPopInvoked: (didPop) => false,
        canPop: false,
        child: Container(
          key: gameScreenKey,
          color: const Color(0xFFFFFFFF),
          child: SafeArea(
            child: Stack(
              children: [
                GameWidget<SnowballerGame>(
                  game: snowBallerGame,
                ),
                const CoinCounter(),
                const CanHitFlaricsLabel(),
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

class CanHitFlaricsLabel extends StatelessWidget {
  const CanHitFlaricsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 4,
      bottom: 4,
      child: Text(
        context.watch<GameLogic>().canHitFlarics
            ? 'You can now hit Flarics'
            : '',
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
