import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class LogService extends ChangeNotifier {
  final logCollection = FirebaseFirestore.instance.collection('log');

  Stream<QuerySnapshot> read(String uid) {
    return logCollection
        .where('uid', isEqualTo: uid)
        .orderBy('time', descending: true)
        .snapshots();
  }

  void create(String uid, Contact person, Timestamp time, String memo,
      bool? type) async {
    await logCollection.add({
      'uid': uid,
      'oneName': person.givenName,
      'onePhone': person.phones!.first.value,
      'oneCompany': person.company,
      'oneJob': person.jobTitle,
      'oneEmail': person.emails!.first.value,
      'time': time,
      'memo': memo,
      'type': type,
    });
    notifyListeners();
  }

  void delete(String docId) async {
    await logCollection.doc(docId).delete();
    notifyListeners();
  }
}
