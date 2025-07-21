import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';

class Newhabit extends StatefulWidget {
  const Newhabit({super.key, required this.addNewHabit});
  final void Function(Clshabits habit) addNewHabit;
  @override
  State<StatefulWidget> createState() {
    return _Newhabit();
  }
}

class _Newhabit extends State<Newhabit> {
  TimeOfDay? _reminder;
  final _habitNameInput = TextEditingController();
  final _habitDescInput = TextEditingController();

  String _selectedCategory = habitCategories.first;

  void _pickTimeForReminder() async {
    final pickedDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _reminder = pickedDate;
    });
  }

  void _showAlertMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.error),
        title: Text('ERROR'),
        content: Text('Please make sure you filled all the required data'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _checkIfInfoIsComplete() {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (_habitNameInput.text.isEmpty || _habitDescInput.text.isEmpty) {
      _showAlertMessage();
    } else {
      _addNewHabit();
      Navigator.pop(context);
    }
  }

  void _addNewHabit() {
    widget.addNewHabit(
      Clshabits(
        nameOfHabit: _habitNameInput.text,
        selectedCategory: _selectedCategory,
        currentStreak: 0,
        longestStreak: 0,
        reminder: _reminder,
        lastCompleted: DateTime.now(),
        notesAboutHabit: _habitDescInput.text,
      ),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    _habitNameInput.dispose();
    _habitDescInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _habitNameInput,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Please Enter Habit Name')),
          ),
          TextField(
            controller: _habitDescInput,
            keyboardType: TextInputType.text,
            maxLength: 100,
            decoration: InputDecoration(label: Text('Notes on habit : ')),
          ),
          Divider(),

          Container(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              icon: Icon(Icons.arrow_downward),
              label: Text(
                'More Options : ',
                style: GoogleFonts.lato(fontSize: 25),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 15),

          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  _pickTimeForReminder();
                },
                label: Text('Set Reminder : '),
                icon: Icon(Icons.timer),
              ),
              Spacer(),

              DropdownButton(
                value: _selectedCategory,
                items: habitCategories
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue == null) {
                    return;
                  } else {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  }
                },
              ),
            ],
          ),

          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton.icon(
              onPressed: () {
                _checkIfInfoIsComplete();
              },
              label: Text('Save', style: GoogleFonts.lato(fontSize: 20)),
              icon: Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}
