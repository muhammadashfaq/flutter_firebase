import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/BrewModel.dart';


class BrewTile extends StatelessWidget {

  final BrewModel brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text(
            'Takes ${brew.sugars} sugars'
          ),
        ),
      ),
    );
  }
}
