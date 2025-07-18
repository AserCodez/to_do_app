import 'package:flutter/material.dart';

class Newhabit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Newhabit();
  }
}

class _Newhabit extends State<Newhabit> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textInput = TextEditingController();
    final _numberInput=TextEditingController();


    return Container(
      child: Column(
        children: [
          TextField(
            controller: _textInput,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Please Enter Habit Name')),
          ),
          
          TextField(
            controller: _numberInput,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Please Enter Habit Name')),
          ),
        ],
      ),
    );
  }
}
