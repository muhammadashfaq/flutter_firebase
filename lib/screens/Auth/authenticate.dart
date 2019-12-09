import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/Auth/Login.dart';
import 'package:flutter_firebase/screens/Auth/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;
  void toggleView (){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(showLogin){
      return Login(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
}
