import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/resuable_expanded.dart';

class Login extends StatefulWidget {
//  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  IconData hideIcon = FontAwesomeIcons.eyeSlash;
  bool hideTextValue = true;
  bool enableHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Hello Again!',
                      style: kTextStyle,
                    ),
                    Text(
                      "Wellcome back you've \n been missed!",
                      textAlign: TextAlign.center,
                      style: kMsgTextStyle,
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            suffixIcon: null,
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Enter username',
                            labelStyle: kparaTextStyle,
                            hintStyle: kparaTextStyle,
                            hintText:
                                'How would you like to know you by others ?',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          obscureText: hideTextValue,
                          decoration: InputDecoration(
                            suffixIcon: TextButton(
                              onPressed: () {
                                setState(() {
                                  if (enableHide) {
                                    hideTextValue = false;
                                    hideIcon = FontAwesomeIcons.eye;
                                    enableHide = false;
                                  } else {
                                    hideTextValue = true;
                                    hideIcon = FontAwesomeIcons.eyeSlash;
                                    enableHide = true;
                                  }
                                });
                              },
                              child: Icon(
                                hideIcon,
                                color: Color(0xFFC8C6CF),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Password',
                            labelStyle: kparaTextStyle,
                            hintText: 'Your secret password',
                            hintStyle: kparaTextStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(18.0),
                              child: TextButton(
                                  onPressed: () {
                                    print('Recovery Password is pressed.');
                                  },
                                  child: Text(
                                    'Recovery Password',
                                    style: kRecoveryTextField,
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          height: 60.0,
                          child: ElevatedButton(
                              onPressed: () {
                                print('Sign in got pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFEE6867),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                              child: Text('Sign in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0))),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(18.0),
                            child: SizedBox(
                              height: 55.0,
                              width: 100.0,
                              child: Divider(
                                color: Colors.black,
                                height: 8.0,
                                thickness: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                            ),
                          ),
                          Text(
                            'Or continue with',
                            style: kRecoveryTextField,
                          ),
                          Container(
                            padding: EdgeInsets.all(18.0),
                            child: SizedBox(
                              height: 55.0,
                              width: 100.0,
                              child: Divider(
                                color: Colors.black,
                                height: 8.0,
                                thickness: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            ReusableExpanded(
                              iconUrl: googleIconUrl,
                              onPressedCustom: () {
                                print('Google got pressed');
                              },
                            ),
                            SizedBox(
                              width: 28.0,
                            ),
                            ReusableExpanded(
                              iconUrl: appleIconUrl,
                              onPressedCustom: () {
                                print('Apple got pressed');
                              },
                            ),
                            SizedBox(
                              width: 28.0,
                            ),
                            ReusableExpanded(
                              iconUrl: facebookIconUrl,
                              onPressedCustom: () {
                                print('Facebook got pressed');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Not a member?',
                            style: kRecoveryTextField,
                          ),
                          TextButton(
                            onPressed: () {
                              print('Register got pressed');
                            },
                            child: Text(
                              'Register now',
                              style: kRegisterTextStyle,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableTextFormField extends StatelessWidget {
  // const ReusableTextFormField({ Key? key, }) : super(key: key);

  final Widget? icon;
  final String? textLabel;
  final String? hintTextLabel;
  final bool? hideText;

  ReusableTextFormField(
      {Widget? this.icon,
      String? this.textLabel,
      String? this.hintTextLabel,
      bool? this.hideText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideText!,
      decoration: InputDecoration(
        suffixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        labelText: textLabel.toString(),
        labelStyle: kparaTextStyle,
        hintText: hintTextLabel.toString(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
