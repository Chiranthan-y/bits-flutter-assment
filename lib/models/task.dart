import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Task extends ParseObject implements ParseCloneable {
  Task() : super('Task');
  Task.clone() : this();

  @override
  Task clone(Map<String, dynamic> map) => Task.clone()..fromJson(map);

  String get title => get<String>('title')!;
  set title(String title) => set<String>('title', title);

  DateTime get dueDate => get<DateTime>('dueDate')!;
  set dueDate(DateTime dueDate) => set<DateTime>('dueDate', dueDate);

  bool get isCompleted => get<bool>('isCompleted')!;
  set isCompleted(bool isCompleted) => set<bool>('isCompleted', isCompleted);
}
