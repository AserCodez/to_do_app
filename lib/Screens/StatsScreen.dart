import 'package:flutter/material.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';
import 'package:to_do_app/DummyData/dummyData.dart';
import 'package:to_do_app/Widgets/Habits_List/habitsCardLister.dart';

class Statsscreen extends StatefulWidget {
  const Statsscreen({super.key});

  @override
  State<Statsscreen> createState() => _StatsscreenState();
}

class _StatsscreenState extends State<Statsscreen> {
  void issHabitChecked(Clshabits habit, bool isChecked) {}

  void _sortHabits(bool flag) {
    if (flag == true) {
      setState(() {
        checkedHabits.sort(
          (habit1, habit2) =>
              habit1.lastCompleted.compareTo(habit2.lastCompleted),
        );
      });
    } else {
      setState(() {
        checkedHabits.sort(
          (habit1, habit2) =>
              habit1.lastCompleted.compareTo(habit2.lastCompleted),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool flag = true;
    IconData sortIcon = Icons.arrow_upward;

    return Scaffold(
      body: Column(
        children: [
          TextButton.icon(
            icon: Icon(sortIcon),
            onPressed: () {
              _sortHabits(flag);
              flag = false;
              sortIcon = Icons.arrow_downward;
            },
            label: Text(flag ? 'Sort by asc' : 'Sort by desc'),
          ),
          Expanded(
            child: Habitscardlister(
              recivedList: checkedHabits,
              onHabitChecked: issHabitChecked,
              recivedType: TypeOfCard.checkedHabits,
            ),
          ),
        ],
      ),
    );
  }
}
