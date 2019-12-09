import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/UserModel.dart';
import 'package:flutter_firebase/screens/Auth/authenticate.dart';
import 'package:flutter_firebase/screens/Home/Home.dart';
import 'package:provider/provider.dart';


class SessionWrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    print(user);

    if(user != null){
      return Home();
    }else{
      return Authenticate();
    }
  }
}
