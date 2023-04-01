import 'package:flutter/material.dart';

class AddTasksScreen extends StatelessWidget {
  // const AddTasksScreen({super.key});

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
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
