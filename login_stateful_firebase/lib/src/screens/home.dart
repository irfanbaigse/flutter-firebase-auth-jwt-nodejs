import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Text('Welcome here'),
      ),
    ));
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0.0, // flat to screen
      title: const Text('Flutter Firebase Jwt Demo'),
      backgroundColor: Colors.deepPurpleAccent,
      actions: <Widget>[
        GestureDetector(
          onTap: () async {
            await _auth.signOut();
          },
          child: Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
