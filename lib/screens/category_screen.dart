import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoey_flutter/models/category_data.dart';
import 'package:todoey_flutter/screens/add_category_screen.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/widgets/categories_list.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[600],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => AddCategoryScreen())
            );
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.black,
                    // color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Lists',
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<CategoryData>(context).categoryCount} Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),




                // Container(
                //   height: MediaQuery.of(context).size.height /* * 0.5*/,
                //   width: MediaQuery.of(context).size.width,
                  /*child: Expanded(
                    child:*/ Container(
                      height: MediaQuery.of(context).size.height*0.6,
                      // height: MediaQuery.of(context).size.height*0.6925,
                        width: MediaQuery.of(context).size.width,
                      //padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        // color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: CategoriesList(),
                    ),
                  //),
                //),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 20.0),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20.0),
          //         topRight: Radius.circular(20.0),
          //       ),
          //     ),
          //     child: TasksList(),
          //   ),
          // ),





          // SingleChildScrollView(
          //   child: Wrap(
          //     alignment: WrapAlignment.start,
          //     direction: Axis.horizontal,
          //     children: [
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.5,
          //         child: Card(
          //           elevation: 10,
          //           child: ListTile(
          //             leading: Icon(Icons.all_inbox, color: Colors.blue,),
          //             title: Text('1 Category'),
          //             subtitle: Text('${Provider.of<TaskData>(context).taskCount} Tasks'),
          //             //trailing: Icon(Icons.more_vert),
          //             onTap: () {
          //               Navigator.of(context).push(_createRoute());
          //               // Navigator.push(
          //               //   context,
          //               //   MaterialPageRoute(builder: (context) => TasksScreen()),
          //               // );
          //             },
          //           ),
          //         )
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.5,
          //         child: Card(
          //           elevation: 10,
          //           child: ListTile(
          //             leading: Icon(Icons.all_inbox, color: Colors.orange,),
          //             title: Text('2 Category'),
          //             subtitle: Text('X Tasks'),
          //             //trailing: Icon(Icons.more_vert),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.5,
          //         child: Card(
          //           elevation: 10,
          //           child: ListTile(
          //             leading: Icon(Icons.all_inbox, color: Colors.red,),
          //             title: Text('3 Category'),
          //             subtitle: Text('X Tasks'),
          //             //trailing: Icon(Icons.more_vert),
          //           ),
          //         ),
          //       ),
          //       Container(
          //           width: MediaQuery.of(context).size.width * 0.5,
          //           child: Card(
          //             elevation: 10,
          //             child: ListTile(
          //               leading: Icon(Icons.all_inbox, color: Colors.green,),
          //               title: Text('4 Category'),
          //               subtitle: Text('X Tasks'),
          //               //trailing: Icon(Icons.more_vert),
          //             ),
          //           )
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.5,
          //         child: Card(
          //           elevation: 10,
          //           child: ListTile(
          //             leading: Icon(Icons.all_inbox, color: Colors.purple,),
          //             title: Text('5 Category'),
          //             subtitle: Text('X Tasks'),
          //             //trailing: Icon(Icons.more_vert),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.5,
          //         child: Card(
          //           elevation: 10,
          //           child: ListTile(
          //             leading: Icon(Icons.all_inbox, color: Colors.red,),
          //             title: Text('6 Category'),
          //             subtitle: Text('X Tasks'),
          //             //trailing: Icon(Icons.more_vert),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )







        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TasksScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      // return ScaleTransition(
      //   scale: Tween<double>(
      //     begin: 0.0,
      //     end: 1.0,
      //   ).animate(
      //     CurvedAnimation(
      //       parent: animation,
      //       curve: Curves.fastOutSlowIn,
      //     ),
      //   ),
      //   child: RotationTransition(
      //     turns: Tween<double>(
      //       begin: 0.0,
      //       end: 1.0,
      //     ).animate(
      //       CurvedAnimation(
      //         parent: animation,
      //         curve: Curves.linear,
      //       ),
      //     ),
      //     child: child,
      //   ),
      // );

      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      );

      // return SlideTransition(
      //   position: Tween<Offset>(
      //     begin: const Offset(1, 0),
      //     end: Offset.zero,
      //   ).animate(animation),
      //   /* position: tween.animate(curvedAnimation), */
      //   child: child,
      // );

      // return child;
    },
  );
}