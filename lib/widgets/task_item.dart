import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final DateTime dueDate;
  final bool isCompleted;
  final Function onToggleComplete; // Callback to update status

  TaskItem({required this.title, required this.dueDate, required this.isCompleted, required this.onToggleComplete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(dueDate.toString()),
      leading: Checkbox(
        value: isCompleted,
        onChanged: (value) => onToggleComplete(value!), 
      ),
      // Optionally add trailing icons for edit/delete
    );
  }
}
