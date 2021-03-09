import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/category_screen.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

import 'models/category_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //           create: (context) => CategoryData(),
    //       ),
    //     ],
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: Scaffold(
    //         body: CategoryScreen(),
    //       ),
    //     ),
    //   );

    return ChangeNotifierProvider(
      create: (context) => CategoryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  /*TasksScreen(), */ CategoryScreen()
      ),
    );
  }
}
