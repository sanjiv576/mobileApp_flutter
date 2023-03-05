import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'MY BUSINESS CARD',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alegreya Sans SC'),
          ),
          backgroundColor: Colors.orange[900],
          shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),)
              ),
        ),
        body: SafeArea(
            child: Container(
          color: Colors.blue[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/myPic.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'SANJIV SHRESTHA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya Sans SC'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.5,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya Sans SC'),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                color: Colors.white,
                // padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                    size: 25.0,
                  ),
                  title: Text(
                    '+977 9812345678',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Alice'),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                // padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                    size: 25.0,
                  ),
                  title: Text(
                    'shrestha@gmail.com',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Alice'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Text(
                'CONNECT ME ON',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya Sans SC'),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 140.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.facebook,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/instagram.png'),
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/linkedin.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
