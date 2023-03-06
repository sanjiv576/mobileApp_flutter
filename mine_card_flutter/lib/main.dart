import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// // 'stless' for boilerplate
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.pink,
//         body: SafeArea(
//           child: Container(
//             color: Colors.white,
//             height: 100.0,
//             width: 100.0,
//             padding: const EdgeInsets.all(10.0),
//             margin: const EdgeInsets.fromLTRB(10.4, 40.5, 5.0, 10.0),
//             child: const Text('My Home'),
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[200],
        body: SafeArea(
          child: Container(
            height: 200,
            width: 300,
            color: Colors.white,
            alignment: Alignment.center,
           // decoration: const BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue,),
            margin: const EdgeInsets.only(left: 50.75),
            padding: const EdgeInsets.all(30),
            child: const Text('Hello World'),

          ),
        ),
      ),
    );
  }
}
