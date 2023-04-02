import 'package:flutter/material.dart';
import 'package:todoey_list_flutter/models/tasks.dart';
import '../screens/tasks_screen.dart';

String? newToDo;

class AddTasksScreen extends StatelessWidget {
  // const AddTasksScreen({super.key});

  final addTaskCallBack;
  AddTasksScreen({required this.addTaskCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 30.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (value) {
                newToDo = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  addTaskCallBack(newToDo);
                  Navigator.pop(context);
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
