import 'package:flutter/material.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';

class Habitcard extends StatefulWidget {
  const Habitcard({
    super.key,
    required this.habitData,
    required this.handleHabitToggled,
  });

  final Clshabits habitData;
  final void Function(Clshabits habitData, bool isChecked) handleHabitToggled;

  @override
  State<Habitcard> createState() => _HabitcardState();
}

class _HabitcardState extends State<Habitcard> {
  

  bool isChecked = false;
  void _setDone(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
    widget.handleHabitToggled(widget.habitData, isChecked);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),

      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              key: ObjectKey(widget.habitData),
              value: isChecked,
              onChanged: _setDone,
            ),
            Icon(
              widget.habitData.categoryIcon,
              color: isChecked ? Colors.blue : Colors.blueGrey,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.habitData.nameOfHabit,
                style: TextStyle(
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
