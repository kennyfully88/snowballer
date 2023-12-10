import 'package:flutter/material.dart';

class GameLogic extends ChangeNotifier {
  int coins = 0;

  void addCoin() {
    coins++;
    notifyListeners();
  }

  void resetGame() {
    coins = 0;
  }
}
