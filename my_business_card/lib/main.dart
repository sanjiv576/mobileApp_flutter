// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'custom_shape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MY BUSINESS CARD',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alegreya Sans SC'),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF004aad),
          toolbarHeight: 130.0,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              color: const Color(0xFFff5757),
              //    width: 900.0,
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
          color: const Color(0xFF004aad),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/myPic.png'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'SANJIV SHRESTHA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya Sans SC'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'LEARNING FLUTTER',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.5,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya Sans SC'),
              ),
              const SizedBox(
                height: 14.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ),
              const Card(
                color: Colors.white,
                // padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
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
              const Card(
                color: Colors.white,
                // padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
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
              const SizedBox(
                height: 16.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 1.7,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'CONNECT ME ON',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya Sans SC'),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      // color: Colors.white,  // cannot define color because of already in BoxDecoration
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 15.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.facebook,
                              size: 50.0,
                              color: Colors.blue,
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage('images/instagram.png'),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage('images/linkedin.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Text(''))
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}



/*

Wrap(
                children: [
                  const Text(
                    'CONNECT ME ON',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya Sans SC'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    // color: Colors.white,  // cannot define color because of already in BoxDecoration
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 165.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.facebook,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('images/instagram.png'),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('images/linkedin.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )

              
*/