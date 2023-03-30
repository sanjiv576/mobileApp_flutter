import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/resuable_rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final FirebaseAuth? _auth;
  String? userEmail;
  String? userPassword;
  bool showSpinner = false;

  void initializeFirebase() async {
    // dont miss these , otherwise throws an error
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // _auth = await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    _auth = FirebaseAuth.instance;
  }

  @override
  void initState() {
    super.initState();

    initializeFirebase();
  }

  void startSpinning() {
    setState(() {
      showSpinner = true;
    });
  }

  void stopSpinning() {
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // add Hero animation --> destination/ending point
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  userEmail = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  userPassword = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              ReusableRoundedButton(
                nameText: 'Log in',
                colour: Colors.lightBlueAccent,
                onPressCustom: () async {
                  //Implement log in functionality.
                  if (userEmail != null && userPassword != null) {
                    startSpinning();

                    try {
                      // UserCredential? user;
                     UserCredential user = await _auth!.signInWithEmailAndPassword(
                          email: userEmail!, password: userPassword!);
                      if (user != null) {
                        print('$userEmail is logged in');
                        Navigator.pushNamed(context, ChatScreen.id);
                      } else {
                        print('Failed to login');
                      }
                    } catch (e) {
                      print(e);
                    }
                    stopSpinning();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
