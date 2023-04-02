import 'package:flutter/material.dart';
import '../constants.dart';

class TasksTile extends StatelessWidget {
  bool? isChecked;

  final String? taskTitle;

  final toggleCheckboxState;

  TasksTile({required this.isChecked, required this.taskTitle, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle.toString(),
        style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold ,
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}


// class TaskCheckBox extends StatelessWidget {
//   // const TaskCheckBox({super.key});

//   final bool? checkboxState;
//   final toggleCheckboxState;

//   const TaskCheckBox(
//       {required this.checkboxState, required this.toggleCheckboxState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkboxState,
//       activeColor: Colors.lightBlueAccent,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }
