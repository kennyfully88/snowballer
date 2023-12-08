import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/providers/settings.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.watch<Settings>().defaultFont,
      child: PopScope(
        onPopInvoked: (didPop) => false,
        canPop: false,
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Snowballer',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
