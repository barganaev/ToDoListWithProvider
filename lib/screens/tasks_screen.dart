import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/category_data.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/category_tile.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  String newCategoryTitle;
  TasksScreen({@required this.newCategoryTitle});
  // TaskData taskData;
  // TasksScreen({this.taskData});
  int cnt=0;
  @override
  Widget build(BuildContext context) {
    print("jackson bek ${this.cnt++}");
    // print(Provider.of<TaskData>(context).tasks.first.name);
    return Scaffold(
      backgroundColor: Color(0xFF5786FF),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF5786FF),
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (chontext) => ChangeNotifierProvider.value(
                  value: Provider.of<TaskData>(context),
                  child: SingleChildScrollView(
                      child:Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(chontext).viewInsets.bottom),
                        child: AddTaskScreen(),
                      )
                  ),
                )
            );
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05, left: MediaQuery.of(context).size.width * 0.04),
                child: IconButton(color: Colors.white, icon: Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context);}),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05, left: MediaQuery.of(context).size.width * 0.75),
                child: Align(alignment: Alignment.topRight, child: Icon(Icons.more_vert, color: Colors.white,)),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                top: 50.0, left: MediaQuery.of(context).size.width * 0.12 /*50.0*/, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: categoryIcons(newCategoryTitle),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${newCategoryTitle}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),


          Flexible(
            child: Container(
              // height: MediaQuery.of(context).size.height*0.8,
              // width: MediaQuery.of(context).size.width,
              //padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),



          // Expanded(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.8,
          //     width: MediaQuery.of(context).size.width,
          //     //padding: EdgeInsets.symmetric(horizontal: 20.0),
          //     decoration: BoxDecoration(
          //       color: Colors.red,
          //       // color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20.0),
          //         topRight: Radius.circular(20.0),
          //       ),
          //     ),
          //     child: TasksList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
