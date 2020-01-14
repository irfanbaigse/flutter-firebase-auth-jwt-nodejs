import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/screens/authenticate/register.dart';
import 'package:login_stateful_firebase/src/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticateState();
  }
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  bool isLoading;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    }

    return Register(toggleView: toggleView);
  }
}
