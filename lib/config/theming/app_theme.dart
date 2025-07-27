import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.deepPurple,
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.deepPurpleAccent,
      background: Colors.black,
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.white,
      onSecondary: Colors.white70,
      onBackground: Colors.white,
      onSurface: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    cardColor: const Color(0xFF1E1E1E),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.white,
      iconColor: Colors.white70,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.white60),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white70),
      labelLarge: TextStyle(color: Colors.greenAccent),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepPurpleAccent,
    ),
    dividerColor: Colors.grey[700],
    iconTheme: const IconThemeData(color: Colors.white70),
    splashColor: Colors.deepPurpleAccent.withOpacity(0.1),
    highlightColor: Colors.deepPurpleAccent.withOpacity(0.2),
    useMaterial3: true,
  );
}
