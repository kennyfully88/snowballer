import 'package:flutter/material.dart';

class EndingScreen extends StatefulWidget {
  const EndingScreen({super.key});

  @override
  State<EndingScreen> createState() => _EndingScreenState();
}

class _EndingScreenState extends State<EndingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000000),
      child: const Center(
        child: Text(
          'You win! You saved Peaman!',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
