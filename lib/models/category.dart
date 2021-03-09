import 'package:todoey_flutter/models/task_data.dart';

class iCategory {
  String category;
  //final Icon icon;
  bool isDone;
  TaskData taskData;

  iCategory({this.category, this.isDone = false, this.taskData});

  void iToggleDone() {
    isDone = !isDone;
  }
}
