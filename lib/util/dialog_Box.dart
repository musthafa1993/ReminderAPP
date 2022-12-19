import 'package:flutter/material.dart';

import 'my_Button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,

  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade50,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(cursorColor: Colors.green,
              controller:  controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new  task",),style: TextStyle(color: Colors.black),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //SAVE button
                MyButton(text: "save", onPressed: onSave,),
                const SizedBox(width: 8),
                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],)
          ],
        ),
      ),
    );
  }
}