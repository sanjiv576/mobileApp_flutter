class Tasks {
  String? taskName;
  bool isDone;

  

  Tasks({required this.taskName, this.isDone = false});

  void toggleDone() => isDone = !isDone;
}
