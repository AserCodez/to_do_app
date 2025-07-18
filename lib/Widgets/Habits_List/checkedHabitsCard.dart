import 'package:flutter/material.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';

class CheckedHabitsCard extends StatelessWidget {
  const CheckedHabitsCard({super.key, required this.recivedHabit});

  final Clshabits recivedHabit;

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
              key: ObjectKey(recivedHabit),
              value: true,
              onChanged: (bo) {},
            ),
            Icon(recivedHabit.categoryIcon, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                recivedHabit.nameOfHabit,
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
