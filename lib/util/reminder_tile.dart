import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReminderTile extends StatelessWidget {
  final String taskName;
  final bool taskComleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ReminderTile({super.key,
    required this.taskName,
    required this.taskComleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(

          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(12),
            )

          ],

        ),


        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskComleted,
                onChanged: onChanged,),
              //taskName
              Text(
                taskName,
                style: TextStyle(
                  decoration:taskComleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}