import 'package:flutter/material.dart';
import '../constants.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
      TasksTile(),
    ]);
  }
}
