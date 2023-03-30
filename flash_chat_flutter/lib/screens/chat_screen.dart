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
            // StreamBuilder --> widget that builds iteself from the lastest snapshot by interacting with Stream
            StreamBuilder<QuerySnapshot>(
              // from where data come
              stream: _firestore.collection('messages').snapshots(),
              // build and return widget when new value event occurs i.e when new message is sent
              builder: (context, snapshot) {
                // data data in Column widget if the snapshot has data
                if (snapshot.hasData) {
                  // convert data into Map since it has data in QuerySnapshot
                  final messages = snapshot.data!.docs;

                  // store data in widget to return at last
                  List<MessageBubble> messageWidgets = [];

                  // get each data/message by looping
                  for (var message in messages) {
                    // get sent message text
                    final messageText = message.get('text');
                    // get each sender that sent message
                    final messageSender = message.get('sender');
                    // wrap both sender and message in a Text widget
                    final messageWidget =
                        MessageBubble(sender: messageSender, text: messageText);

                    // add get Text widget in the list
                    messageWidgets.add(messageWidget);
                  }

                  // return Column widget
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: messageWidgets,
                    ),
                  );
                } else {
                  // return a spinning progress if the snapshot does not have data or null
                  return Center(
                    child:
                        CircularProgressIndicator(backgroundColor: Colors.blue),
                  );
                }
              },
            ),
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

// UI for each message display

class MessageBubble extends StatelessWidget {
  // const MessageBubble({super.key});

  final String? sender;
  final String? text;

  MessageBubble({required this.sender, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender.toString(),
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: BorderRadius.circular(34.0),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
              child: Text(
                text.toString(),
                style: TextStyle(fontSize: 20.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
