import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/habits.dart';

var kColorScheme = ColorScheme.fromSeed(
  secondaryContainer: const Color.fromARGB(255, 249, 218, 19),
  seedColor: const Color.fromARGB(255, 40, 63, 213),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
        ),
      ).copyWith(),
      home: HabitsScreen(),
    ),
  );
}
