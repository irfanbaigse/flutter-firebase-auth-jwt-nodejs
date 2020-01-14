import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/wraaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Jwt Demo',
      home: Wrapper(),
    );
  }
}
