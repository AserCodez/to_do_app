import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';
import 'package:to_do_app/DummyData/dummyData.dart';
import 'package:to_do_app/Screens/StatsScreen.dart';
import 'package:to_do_app/Screens/newHabit.dart';
import 'package:to_do_app/Widgets/Habits_List/habitsCardLister.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});
  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  int selectedIndex = 0;
  void isHabitChecked(Clshabits habit, bool isChecked) {
    if (isChecked) {
      checkedHabits.add(habit);
      dummyHabits.remove(habit);
    }
  }

  void _addNewHabit() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,//Used to make the overlay cover the whole screen
      context: context,
      builder: (context) => Newhabit(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> activeScreen = [
      Habitscardlister(
        recivedList: dummyHabits,
        onHabitChecked: isHabitChecked,
        recivedType: TypeOfCard.uncheckedHabits,
      ),
      Statsscreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, //Only the selected label
        type: BottomNavigationBarType.shifting, //Makes the background white
        onTap: (assignedIndex) {
          //when we tap we get the assigned index
          setState(() {
            selectedIndex = assignedIndex;
          });
        },
        currentIndex:
            selectedIndex, //Make the index dynamic by taking it from on Tap
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(
              255,
              3,
              49,
              141,
            ), //To see the icon when you shift
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 3, 49, 141),
            icon: Icon(Icons.checklist_rounded),
            label: 'Checked Items',
          ),
        ],
      ),
      body: activeScreen[selectedIndex],
      appBar: AppBar(
        title: Text('HABIT TRACKER', style: GoogleFonts.lato()),
        actions: [IconButton(onPressed: _addNewHabit, icon: Icon(Icons.add))],
      ),
    );
  }
}
