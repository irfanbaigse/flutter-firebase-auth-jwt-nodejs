import 'package:flutter/material.dart';
import 'package:login_stateful_firebase/src/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  // constructor
  SignIn({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        title: Text('Flutter Firebase Jwt Demo - Login'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0),
                emailField(),
                SizedBox(height: 20.0),
                passwordField(),
                SizedBox(height: 20.0),
                submitButton(),
                SizedBox(height: 12.0),
                FlatButton(
                    onPressed: () => widget.toggleView(),
                    child: Text('REGISTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue))),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      // padding: EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: 'Enter your email address',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: Icon(Icons.email),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
            )),
        onChanged: (val) {
          setState(() => email = val);
        },
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          hintText: 'Enter password',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: Icon(Icons.security),
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          )),
      obscureText: true,
      onChanged: (val) {
        setState(() => password = val);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        color: Colors.deepPurpleAccent,
        child: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            print(email);
            print(password);

            _formKey.currentState.save();
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              this.setState(() => error = 'Please supply valid email');
            }
          }
        });
  }
}
