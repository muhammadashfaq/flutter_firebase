import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/UserModel.dart';
import 'package:flutter_firebase/screens/SessionWrapper.dart';
import 'package:flutter_firebase/service/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: SessionWrapper(),
      ),
    );
  }
}