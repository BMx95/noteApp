import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDark = false;

  static ThemeMode get currentTheme =>
      _isDark ? ThemeMode.dark : ThemeMode.light;
  static var dark = ThemeData.dark();
  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  static ThemeData get mainTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.brown,
      backgroundColor: Colors.brown,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey,
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      dialogBackgroundColor: Colors.brown,
      textTheme: TextTheme(
        body1: TextStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      backgroundColor: ThemeData.dark().backgroundColor,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey,
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      iconTheme: dark.iconTheme,
      textTheme: dark.textTheme,
      hintColor: dark.hintColor,
      dialogTheme: dark.dialogTheme,
      dialogBackgroundColor: dark.dialogBackgroundColor,
      cardColor: dark.cardColor,
      canvasColor: dark.canvasColor,
      accentIconTheme: dark.accentIconTheme,
      primaryIconTheme: dark.primaryIconTheme,
      textButtonTheme: dark.textButtonTheme,
    );
  }
}
