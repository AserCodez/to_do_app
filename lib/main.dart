import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/habits.dart';
import 'dart:io';

var kColorScheme = ColorScheme.fromSeed(
  secondaryContainer: const Color.fromARGB(255, 249, 218, 19),
  seedColor: const Color.fromARGB(255, 40, 63, 213),
);

void main() {
  Widget currentStyling;

  if (Platform.isIOS) {
    currentStyling = CupertinoApp(
      theme: CupertinoThemeData(
        primaryContrastingColor: kColorScheme.primaryContainer,
        barBackgroundColor: kColorScheme.onPrimaryContainer,
      ).copyWith(),
      home: HabitsScreen(),
    );
  } else {
    currentStyling = MaterialApp(
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
    );
  }

  runApp(currentStyling);
}
