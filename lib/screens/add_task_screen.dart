import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  TaskData taskData;
  AddTaskScreen({this.taskData});
  String newTaskTitle = "";
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),

      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              onSubmitted: (str){
                newTaskTitle = str;
                FocusScope.of(context).unfocus();
                if(str != ""){
                  // print(Provider.of<TaskData>(context, listen: false).tasks.first.name);
                  Provider.of<TaskData>(context, listen: false).addTask(str);
                }
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                print(newTaskTitle);
                FocusScope.of(context).unfocus();
                if(newTaskTitle != ""){
                  print(newTaskTitle);
                  // print(Provider.of<TaskData>(context, listen: false).tasks.first.name);
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
