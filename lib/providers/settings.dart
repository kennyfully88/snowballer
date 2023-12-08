import 'package:flutter/material.dart';

/// The possible difficulties
enum AppDifficulty { easy, normal, hard }

/// The possible UI languages
enum AppLanguage { english, japanese }

/// The game settings
class Settings extends ChangeNotifier {
  /// The current difficulty
  AppDifficulty currentAppDifficulty = AppDifficulty.normal;

  /// The current language
  AppLanguage currentAppLanguage = AppLanguage.english;

  /// Default font
  TextStyle defaultFont = const TextStyle(
    fontFamily: 'zen maru',
    color: Color(0xFF000000),
  );

  /// Change the current difficulty
  void setAppDifficulty(AppDifficulty difficulty) {
    if (currentAppDifficulty == difficulty) return;
    currentAppDifficulty = difficulty;
    notifyListeners();
  }

  /// Change the current language
  void setAppLanguage(AppLanguage language) {
    if (currentAppLanguage == language) return;
    currentAppLanguage = language;
    notifyListeners();
  }
}
