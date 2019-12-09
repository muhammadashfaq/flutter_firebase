import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/BrewModel.dart';
import 'package:flutter_firebase/screens/Home/SettingForm.dart';
import 'package:flutter_firebase/service/auth.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:provider/provider.dart';

import 'BrewList.dart';

class Home extends StatelessWidget {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPannel() {
     showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
            child: SettingForm(),
          );
     });
    }


    return StreamProvider<List<BrewModel>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _authService.signOut();
                },
                icon: Icon(Icons.person,
                  color: Colors.white,
                ),
                label: Text('Logout',
                style: TextStyle(color: Colors.white),)),
            FlatButton.icon(
                onPressed: () {
                  _showSettingPannel();
                },
                icon: Icon(Icons.settings,
                  color: Colors.white,
                ),
                label: Text('Setting',
                  style: TextStyle(color: Colors.white),))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover
              )
            ),
            child: BrewList()),
      ),
    );
  }


}
