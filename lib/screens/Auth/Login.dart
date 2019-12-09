import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/auth.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';

class Login extends StatefulWidget {
  Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();

  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            body: isLoading
                ? Loading()
                : Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Email Please' : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Email',
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Enter 6 digit Password Please'
                            : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            dynamic result = await _authService
                                .signInWithEmailPassword(email, password);
                            if (result != null) {
                            } else {
                              setState(() {
                                error =
                                    "Could not able to log in. Try another credentiols";
                                isLoading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )),
          );
  }
}

//
//RaisedButton(
//child: Text('Sign in Anonymously'),
//onPressed: () async {
//dynamic result = await _authService.signInAnon();
//if(result != null){
//print('Signed in');
//print(result);
//}else{
//print('Error while Signing in');
//}
//},
//),
