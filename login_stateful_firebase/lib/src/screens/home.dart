import 'package:flutter/material.dart';

class Home extends StatelessWidget {

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
    );
  }
}
