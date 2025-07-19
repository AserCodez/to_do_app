import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/Data_Models/clsHabits.dart';

class Newhabit extends StatefulWidget {
  const Newhabit({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Newhabit();
  }
}

class _Newhabit extends State<Newhabit> {
  TimeOfDay? _reminder;
     final _textInput = TextEditingController();
    String _selectedCategory = habitCategories.first;

  void _pickTimeForReminder() async {
    final pickedDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _reminder = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
 

    return Container(
      child: Column(
        children: [
          TextField(
            controller: _textInput,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Please Enter Habit Name')),
          ),
          TextField(
            controller: _textInput,
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
              onPressed: (){},
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
        ],
      ),
    );
  }
}
