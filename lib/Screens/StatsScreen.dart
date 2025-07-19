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
  String _order = 'asc';
      IconData sortIcon = Icons.arrow_upward;


  void issHabitChecked(Clshabits habit, bool isChecked) {}

  void _sortHabits() {
    if (_order == 'asc') {
      setState(() {
        checkedHabits.sort(
          (habit1, habit2) =>
              habit1.lastCompleted.compareTo(habit2.lastCompleted),
        );
        _changeState();
      });
    } else {
      setState(() {
        checkedHabits.sort(
          (habit1, habit2) =>
              habit2.lastCompleted.compareTo(habit1.lastCompleted),
        );
        _changeState();
      });
    }
  }

  void _changeState() {
    _order = _order == 'asc' ? 'desc' : 'asc';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          TextButton.icon(
            icon: Icon(_order=='asc'? Icons.arrow_upward : Icons.arrow_downward ),
            onPressed: () {
              _sortHabits();
            },
            label: Text(_order == 'asc' ? 'Sort by asc' : 'Sort by desc'),
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
