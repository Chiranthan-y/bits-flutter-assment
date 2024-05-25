import 'package:flutter/material.dart';
import 'package:quicktask/models/task.dart';
import 'package:quicktask/screens/add_task_screen.dart';
import 'package:quicktask/widgets/task_item.dart';
import 'package:quicktask/services/task_service.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = []; // Use your Task model

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final tasks = await _taskService.getTasks();
    setState(() => _tasks = tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
              _fetchTasks(); // Refresh the task list
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return TaskItem(
            title: task.title,
            dueDate: task.dueDate,
            isCompleted: task.isCompleted,
            onToggleComplete: (value) async {
              await _taskService.updateTaskStatus(task, value);
              _fetchTasks(); // Refresh the task list
            },
          );
        },
      ),
    );
  }
}
s