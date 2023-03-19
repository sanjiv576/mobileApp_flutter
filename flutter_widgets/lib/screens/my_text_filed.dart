import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 320.0,
          margin: EdgeInsets.only(bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                obscureText: false,
                autofocus: true,
                // autofillHints: 'gamil',

                //
                onChanged: (String value) {
                  if (value == null) {
                    print('ITs value is null');
                  } else if (!value.contains('@')) {
                    print('Missing @');
                  } else {
                    print('Verified email');
                  }
                },

                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'How would you like to contact with others ?',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                // hide/stop the text to being copied or cut for e.g password
                obscureText: false,
                decoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter username'),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                // hide the text because it is password
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  alignLabelWithHint: true,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
