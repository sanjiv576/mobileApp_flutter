import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// make global
final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String? messageText;
  // for clearing the message text field
  final messageTextController = TextEditingController();

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
                //  messageStream();
                //Implement logout functionality
                _auth.signOut();
                print('Logged out');
                Navigator.pop(context);
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
            MessageBuilder(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // clear the field
                      messageTextController.clear();

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

class MessageBuilder extends StatelessWidget {
  // const MessageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // from where data come
      stream: _firestore.collection('messages').snapshots(),
      // build and return widget when new value event occurs i.e when new message is sent
      builder: (context, snapshot) {
        // data data in Column widget if the snapshot has data
        if (snapshot.hasData) {
          // convert data into Map since it has data in QuerySnapshot
          final messages = snapshot
              .data!.docs.reversed; // reversed doc for user experience, step -2

          // store data in widget to return at last
          List<MessageBubble> messageWidgets = [];

          // get each data/message by looping
          for (var message in messages) {
            // get sent message text
            final messageText = message.get('text');
            // get each sender that sent message
            final messageSender = message.get('sender');

            // get current user's email
            final currentUser = loggedInUser!.email;

            // wrap both sender and message in a Text widget
            final messageWidget = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );

            // add get Text widget in the list
            messageWidgets.add(messageWidget);
          }

          // return Column widget
          return Expanded(
            child: ListView(
              // For user experience, step -1
              // up the latest message at the top by enabling reverse as true
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageWidgets,
            ),
          );
        } else {
          // return a spinning progress if the snapshot does not have data or null
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.blue),
          );
        }
      },
    );
  }
}

// UI for each message display

class MessageBubble extends StatelessWidget {
  // const MessageBubble({super.key});

  String? sender;
  String? text;

  bool? isMe;

  MessageBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender.toString(),
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe!
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
            color: isMe! ? Colors.lightBlueAccent : Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
              child: Text(
                text.toString(),
                // textAlign: isMe! ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                    fontSize: 16.9,
                    color: isMe! ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
