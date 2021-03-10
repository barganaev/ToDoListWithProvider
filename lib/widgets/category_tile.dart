import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/category_data.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/category_screen.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

Icon categoryIcons(String categoryName){
  if(categoryName == 'All'){
    return Icon(Icons.all_inbox, color: Colors.purple, size: 40,);
  }else if(categoryName == 'Trash'){
    return Icon(Icons.restore_from_trash, color: Colors.yellow, size: 40,);
  }else if(categoryName == 'Travel'){
    return Icon(Icons.airplanemode_active, color: Colors.brown, size: 40,);
  }else if(categoryName == 'Study'){
    return Icon(Icons.book, color: Colors.orange, size: 40,);
  }else if(categoryName == 'Sport'){
    return Icon(Icons.sports, color: Colors.blue, size: 40,);
  }else if(categoryName == 'Music'){
    return Icon(Icons.music_note, color: Colors.red, size: 40,);
  }else if(categoryName == 'Work' || categoryName == 'Job'){
    return Icon(Icons.work, color: Colors.greenAccent[400], size: 40,);
  }else if(categoryName == 'Home' || categoryName == 'House'){
    return Icon(Icons.home, color: Colors.pink, size: 40,);
  }else{
    return Icon(Icons.folder, color: Colors.grey, size: 40,);
  }
}

class CategoryContainer extends StatelessWidget {

  final bool isChecked;
  final String categoryTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  TaskData taskData;

  CategoryContainer({this.isChecked, this.categoryTitle, this.checkboxCallback, this.longPressCallback});


  @override
  Widget build(BuildContext context) {
    // taskData = Provider.of<TaskData>(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (newcontext) => ChangeNotifierProvider.value(
            value: Provider.of<TaskData>(context),
            child: TasksScreen(newCategoryTitle: categoryTitle,)),
        ),
        );
      },
      child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: categoryIcons(categoryTitle),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),)),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListTile(
                          //leading: Icon(Icons.all_inbox, color: Colors.blue,),
                          title: Text(categoryTitle, style: GoogleFonts.hind(fontSize: 22, fontWeight: FontWeight.w600),),
                          subtitle: Text('${Provider.of<TaskData>(context).taskCount} Tasks'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
    );
  }
}
