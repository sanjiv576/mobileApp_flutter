import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  // const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Learning Widgets'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        
        children: <Widget>[
          ReusableElevatedButtons(
            myWidgetName: 'Text Field',
            myRoute: '/myTextField',
          ),

          SizedBox(height: 10.0,),

          ReusableElevatedButtons(
            myWidgetName: 'Text Form Field',
            myRoute: '/myTextFormField',
          ),
        ],
      )),
    );
  }
}

class ReusableElevatedButtons extends StatelessWidget {
  // const ReusableElevatedButtons({  Key? key,}) : super(key: key);

  final String? myWidgetName;
  final String? myRoute;

  ReusableElevatedButtons({required this.myWidgetName, required this.myRoute});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, myRoute.toString());
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            myWidgetName.toString(),
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            
          ),
        ),);
  }
}


