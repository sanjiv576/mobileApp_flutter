import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final _firestore = FirebaseFirestore.instance;
  String? messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('Active users: $loggedInUser');
      }
    } catch (e) {
      print(e);
    }
  }

// method -1 to get data from the cloud, but, we need to pull data from the cloud manually
  void getMessages() async {
    // get data from the cloud in the form of QuerySnapshot<Map> so loop it to get each message
    final messages = await _firestore.collection('messages').get();

    for (var message in messages.docs) {
      // get each message
      print(message.data());
    }
  }

  // Method -2 to get data from the cloud, automatically fetch data when the changes occur
  void messageStream() async {
    // get data in Stream when the changes occur in the cloud
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      // fetch data in the form of Map
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Example 1
                //  getMessages();
                //  Example 2
                messageStream();
                //Implement logout functionality
                // _auth.signOut();
                // print('Logged out');
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Implement send functionality.
                      print(
                          'Sender : ${loggedInUser!.email} \n Message : $messageText');
                      // send data to the cloud firebase
                      try {
                        // Note: messages --> is the collection name in the cloud,
                        // text and sender are the keys that store values in Map ie key and value pairs
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser!.email
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
