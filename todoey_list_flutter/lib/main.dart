import 'package:flutter/material.dart';
import '../screens/tasks_screen.dart';
void main() => runApp(ToDoApp());


class ToDoApp extends StatelessWidget {
 // const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
      
    );
  }
}