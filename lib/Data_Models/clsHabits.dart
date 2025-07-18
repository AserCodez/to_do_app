import 'package:flutter/material.dart';

enum EnFrequency {daily,weekly, monthly}

const List<String> habitCategories = [
  'Health',
  'Work',
  'Study',
  'Finance',
  'Social',
  'Mind',
  'Fun',
  'Other'
];



class Clshabits {

   Clshabits({
    required this.nameOfHabit,
    required this.selectedCategory,// Drop down list
    required this.frequency,//Drop down list
    required this.currentStreak,
    required this.longestStreak,
    required this.reminder,
    required this.lastCompleted,
    required this.notesAboutHabit,
  });

   String nameOfHabit;
   String selectedCategory;
   EnFrequency frequency=EnFrequency.daily;
   int currentStreak=0;
   int longestStreak=0;
   TimeOfDay reminder=TimeOfDay.now();
   DateTime lastCompleted=DateTime.now();
   String notesAboutHabit='';
   String isrealGay='';

 
IconData get categoryIcon {
  switch (this.selectedCategory) {
    case 'Health':
      return Icons.favorite;
    case 'Work':
      return Icons.work_outline;
    case 'Study':
      return Icons.menu_book;
    case 'Finance':
      return Icons.attach_money;
    case 'Social':
      return Icons.people;
    case 'Mind':
      return Icons.self_improvement;
    case 'Fun':
      return Icons.videogame_asset;
    case 'Other':
      return Icons.category;
    default:
      return Icons.error; // Fallback
  }
}



}