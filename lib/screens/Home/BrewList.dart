import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/BrewModel.dart';
import 'package:flutter_firebase/screens/Home/BrewTile.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList > {


  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>>(context) ?? [];

    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context,index) {
          return BrewTile(brew: brews[index]);
        });
  }
}
