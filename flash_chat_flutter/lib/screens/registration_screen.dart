// for firebase initilization
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../components/resuable_rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

// import for show spinning while registration
class RegistrationScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              // flexible added to expand entire screen
              Flexible(
              // add Hero animation --> destination/ending point
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
                nameText: 'Register',
                colour: Colors.blueAccent,
                onPressCustom: () async {
                  //Implement registration functionality.

                  if (userEmail != null && userPassword != null) {
                    print(userEmail);
                    print(userPassword);
                    // show spinner while registration button is hit
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final newUser = await _auth!
                          .createUserWithEmailAndPassword(
                              email: userEmail!, password: userPassword!);

                      if (newUser != null) {
                         // disappear the spinner
                        setState(() {
                          showSpinner = false;
                        });
                        
                        Navigator.pushNamed(context, ChatScreen.id);
                      }

                     
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                     // disappear the spinner
                        setState(() {
                          showSpinner = false;
                        });
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
