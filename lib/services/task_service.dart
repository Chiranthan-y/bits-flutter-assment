import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quicktask/models/task.dart';

class TaskService {
  Future<List<Task>> getTasks() async {
    final queryBuilder = QueryBuilder(Task())
      ..whereEqualTo('user', ParseUser.currentUser())
      ..orderByDescending('createdAt');
    
    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.cast<Task>();
    } else {
      return [];
    }
  }

  Future<void> addTask(String title, DateTime dueDate) async {
    final task = Task()
      ..set('title', title)
      ..set('dueDate', dueDate)
      ..set('isCompleted', false)
      ..set('user', ParseUser.currentUser());
    await task.save();
  }

  Future<void> updateTaskStatus(Task task, bool isCompleted) async {
    task.set('isCompleted', isCompleted);
    await task.save();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
  }
}
