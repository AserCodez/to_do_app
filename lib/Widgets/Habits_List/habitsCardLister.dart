import 'package:flutter/material.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';
import 'package:to_do_app/Widgets/Habits_List/checkedHabitsCard.dart';
import 'package:to_do_app/Widgets/Habits_List/habitCard.dart';

enum TypeOfCard { checkedHabits, uncheckedHabits }

class Habitscardlister extends StatelessWidget {
  const Habitscardlister({
    super.key,
    required this.recivedList,
    required this.onHabitChecked,
    required this.recivedType,
    required this.onRemovedHabit,
  });
  final TypeOfCard recivedType;
  final List<Clshabits> recivedList;
  final void Function(Clshabits habitDate, bool isChecked) onHabitChecked;
  final void Function(Clshabits habitData) onRemovedHabit;

  Widget selectedCard(int index) {
    Widget selectedWidget;
    if (recivedType == TypeOfCard.uncheckedHabits) {
      selectedWidget = Habitcard(
        habitData: recivedList[index],
        handleHabitToggled: onHabitChecked,
      );
    } else {
      selectedWidget = CheckedHabitsCard(recivedHabit: recivedList[index]);
    }
    return selectedWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recivedList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(selectedCard(index)),
        child: selectedCard(index),
        onDismissed: (direction) {
          onRemovedHabit(recivedList[index]);
        },
      ),
    );
  }
}
