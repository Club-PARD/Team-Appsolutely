import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataService extends ChangeNotifier {
  final dataCollection = FirebaseFirestore.instance.collection('data');

  Stream<QuerySnapshot> read(String uid) {
    return dataCollection.where('uid', isEqualTo: uid).snapshots();
  }

  void create(String data, String uid) async {
    await dataCollection.add({
      'uid': uid,
      'data': data,
    });
    notifyListeners();
  }

  void delete(String docId) async {
    await dataCollection.doc(docId).delete();
    notifyListeners();
  }
}
