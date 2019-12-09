import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/BrewModel.dart';
import 'package:flutter_firebase/model/UserModel.dart';
import 'package:flutter_firebase/screens/Home/BrewList.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {

    try{
      return await brewCollection.document(uid).setData({
        'sugars': sugars,
        'name': name,
        'strength': strength,
      });
    }catch(e){
      print("Database Error: "+e.toString());
      return null;
    }
  }

  //Brew List of Snapshot
  List<BrewModel> _brewListFromSnapshot(QuerySnapshot querySnapshot){
    return querySnapshot.documents.map((doc) {
          return BrewModel(
            name: doc.data['name'] ?? '',
            sugars: doc.data['sugars'] ?? '0',
            strength: doc.data['strength'] ?? 0
          );
    }).toList();
  }

  //Get brews Stream
  Stream<List<BrewModel>> get brews {
      return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //Get user doc stream
 Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
 }

 //user data from snapshot
 UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
}
}
