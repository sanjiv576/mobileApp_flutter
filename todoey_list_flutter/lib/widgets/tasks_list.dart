import 'package:flutter/material.dart';
import '../constants.dart';
import 'tasks_tile.dart';
import '../models/tasks.dart';
import '../screens/tasks_screen.dart';

class TasksList extends StatefulWidget {
  List<Tasks>? tasks;
  TasksList({required this.tasks});


  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // List<Tasks> tasks = [
  //   Tasks(taskName: 'Revise HTML'),
  //   Tasks(taskName: 'Develop group chat app')
  // ];

  //TasksScreen tasksScreen = TasksScreen();

  @override
  Widget build(BuildContext context) {
    // creates dynamic listview
    return ListView.builder(
      itemBuilder: (context, index) {
        // returns each data from tasks list
        return TasksTile(
          isChecked: widget.tasks![index].isDone,
          taskTitle: widget.tasks![index].taskName,
          toggleCheckboxState: (bool currentChechboxState) {
            setState(() {
              // toggle both states of text and checkbox from UI as true/false
              widget.tasks![index].toggleDone();
              // isChecked = currentChechboxState;
            });
          },
        );
      },
      itemCount: widget.tasks!.length,
    );
  }
}
