import 'package:flutter/material.dart';
import '../constants.dart';

class TasksTile extends StatefulWidget {
  @override
  State<TasksTile> createState() => _TasksTileState();
}

class _TasksTileState extends State<TasksTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          'Eat 1 food',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: TaskCheckBox(
          checkboxState: isChecked,
          toggleCheckboxState: (bool currentChechboxState) {
            setState(() {
              // toggle both states of text and checkbox from UI as true/false
              isChecked = currentChechboxState;
            });
          },
        ));
  }
}

class TaskCheckBox extends StatelessWidget {
  // const TaskCheckBox({super.key});

  final bool? checkboxState;
  final toggleCheckboxState;

  const TaskCheckBox(
      {required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
