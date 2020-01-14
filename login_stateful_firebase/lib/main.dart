import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/model/user.dart';
import 'package:login_stateful_firebase/src/services/auth.dart';
import 'package:login_stateful_firebase/src/wraaper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user$,
      child: MaterialApp(
        title: 'Flutter Firebase Jwt Demo',
        home: Wrapper(),
      ),
    );
  }
}
