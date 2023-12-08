import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snowballer/screens/title_screen/title_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2000),
      () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TitleScreen();
          },
        ),
      ),
    );

    return Container(
      color: const Color(0xFFE5E5FF),
      child: SafeArea(
        child: SvgPicture.asset(
          'assets/images/furu_code_logo.svg',
        ),
      ),
    );
  }
}
