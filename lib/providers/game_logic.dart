import 'package:flutter/material.dart';

class GameLogic extends ChangeNotifier {
  int coins = 0;

  bool canHitFlarics = false;

  void addCoin() {
    coins++;
    notifyListeners();
  }

  void enableFlaricHit() {
    canHitFlarics = true;
  }

  void resetGame() {
    coins = 0;
    canHitFlarics = false;
  }
}
