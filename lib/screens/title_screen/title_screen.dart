import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/providers/settings.dart';
import 'package:snowballer/screens/game_screen/game_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.watch<Settings>().defaultFont,
      child: PopScope(
        onPopInvoked: (didPop) => false,
        canPop: false,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const GameScreen();
                },
              ),
            );
          },
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: const SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Snowballer',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tap to start',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
