import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class PrepareService extends ChangeNotifier {
  final prepareCollection = FirebaseFirestore.instance.collection('prepare');

  Stream<QuerySnapshot> read(String uid) {
    return prepareCollection.where('uid', isEqualTo: uid).snapshots();
  }

  void create(String uid, Contact person, Timestamp time, String memo) async {
    await prepareCollection.add({
      'uid': uid,
      'oneName': person.givenName,
      'onePhone': person.phones!.first.value,
      'oneCompany': person.company,
      'oneJob': person.jobTitle,
      'oneEmail': person.emails!.first.value,
      'time': time,
      'memo': memo,
    });
    notifyListeners();
  }

  void delete(String docId) async {
    await prepareCollection.doc(docId).delete();
    notifyListeners();
  }
}
