import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/category_data.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/categories_list.dart';

class AddCategoryScreen extends StatelessWidget {
  // TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newCategoryTitle="";

    return Scaffold(
      appBar: AppBar(
        title: Text('New Category'),
      ),
      body: Column(
        children: [
          TextField(
            // controller: textEditingController,
            autofocus: true,
            onChanged: (newCategory) {
              newCategoryTitle = newCategory;
            },
            decoration: InputDecoration(
              hintText: 'What are you planning?',
              contentPadding: const EdgeInsets.all(16.0)
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesList() /*CategoryTaskScreen()*/));
              if(newCategoryTitle != ""){
                Provider.of<CategoryData>(context, listen: false).addCategory(newCategoryTitle);
              }

              FocusScope.of(context).unfocus();
              Navigator.pop(context, 'Error HEre!');
            },
          )
        ],
      ),

      // body: TextField(
      //   autofocus: true,
      //   onSubmitted: (val) {
      //     // _addTodoItem(val);
      //     Navigator.pop(context);
      //   },
      //   decoration: InputDecoration(
      //       hintText: 'Enter the name of new category...',
      //       contentPadding: const EdgeInsets.all(16.0)
      //   ),
      // ),
    );








    /*Container(
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
              'Add Category',
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
                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );*/
  }
}
