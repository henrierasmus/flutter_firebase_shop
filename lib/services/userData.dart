import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('userData');

  Future updateUserdata(String name, List shoppingCart) async {
    return await userCollection
        .document(uid)
        .setData({'name': name, 'shoppingCart': shoppingCart});
  }

  // getUserData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        shoppingCart: snapshot.data['shoppingCart']);
  }

  List<UserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
        name: doc.data['name'] ?? '',
        shoppingCart: doc.data['shoppingCart'] ?? [],
      );
    }).toList();
  }

  Stream<List<UserData>> get userData {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // get user doc
  Stream<UserData> get getUserData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
