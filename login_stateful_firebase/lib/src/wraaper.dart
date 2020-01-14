import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/screens/authenticate/authenticate.dart';
import 'package:login_stateful_firebase/src/screens/home.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null) {
      return Authenticate();
    }

    // return home or authenticate
    return Home();
  }
}
