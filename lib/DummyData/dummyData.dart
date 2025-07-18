// Dummy data list
import 'package:flutter/material.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';

List<Clshabits> checkedHabits=[];

List<Clshabits> dummyHabits = [
  Clshabits(
    nameOfHabit: 'Drink Water',
    selectedCategory: 'Health',
    frequency: EnFrequency.daily,
    currentStreak: 7,
    longestStreak: 15,
    reminder: TimeOfDay(hour: 8, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(hours: 12)),
    notesAboutHabit: 'Aim for 8 glasses daily',
  ),
  Clshabits(
    nameOfHabit: 'Morning Run',
    selectedCategory: 'Health',
    frequency: EnFrequency.daily,
    currentStreak: 3,
    longestStreak: 10,
    reminder: TimeOfDay(hour: 6, minute: 30),
    lastCompleted: DateTime.now().subtract(Duration(days: 1)),
    notesAboutHabit: '5km target',
  ),
  Clshabits(
    nameOfHabit: 'Read Technical Docs',
    selectedCategory: 'Study',
    frequency: EnFrequency.weekly,
    currentStreak: 4,
    longestStreak: 8,
    reminder: TimeOfDay(hour: 19, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(days: 2)),
    notesAboutHabit: 'Flutter and Dart',
  ),
  Clshabits(
    nameOfHabit: 'Budget Review',
    selectedCategory: 'Finance',
    frequency: EnFrequency.weekly,
    currentStreak: 12,
    longestStreak: 12,
    reminder: TimeOfDay(hour: 20, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(days: 3)),
    notesAboutHabit: 'Track all expenses',
  ),
  Clshabits(
    nameOfHabit: 'Call Family',
    selectedCategory: 'Social',
    frequency: EnFrequency.weekly,
    currentStreak: 2,
    longestStreak: 5,
    reminder: TimeOfDay(hour: 18, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(days: 4)),
    notesAboutHabit: 'Parents and siblings',
  ),
  Clshabits(
    nameOfHabit: 'Meditation',
    selectedCategory: 'Mind',
    frequency: EnFrequency.daily,
    currentStreak: 21,
    longestStreak: 21,
    reminder: TimeOfDay(hour: 7, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(hours: 10)),
    notesAboutHabit: '10 minutes minimum',
  ),
  Clshabits(
    nameOfHabit: 'Gaming Time',
    selectedCategory: 'Fun',
    frequency: EnFrequency.weekly,
    currentStreak: 5,
    longestStreak: 5,
    reminder: TimeOfDay(hour: 21, minute: 0),
    lastCompleted: DateTime.now().subtract(Duration(days: 6)),
    notesAboutHabit: 'Maximum 2 hours',
  ),
];