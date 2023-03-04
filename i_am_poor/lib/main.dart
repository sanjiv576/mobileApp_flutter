import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueAccent[600],
      appBar: AppBar(
        title: const Text('I Am Happy'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg')),
      ),
    ),
  ));
}
