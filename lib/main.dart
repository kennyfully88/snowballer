import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/providers/settings.dart';
import 'package:snowballer/screens/splash_screen/splash_screen.dart';

// No text
// Single button input
// Multiple endings

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Settings>(
          create: (_) => Settings(),
        ),
      ],
      child: const SnowballerApp(),
    ),
  );
}

class SnowballerApp extends StatefulWidget {
  const SnowballerApp({super.key});

  @override
  State<SnowballerApp> createState() => _SnowballerAppState();
}

class _SnowballerAppState extends State<SnowballerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Snowballer',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
