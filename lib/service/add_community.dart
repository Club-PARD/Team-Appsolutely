import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final ContentsReference = FirebaseFirestore.instance.collection('Contents');

userstart(title,contents) {
  List comment = [];
   List like = [];
   int see = 0;
ContentsReference.doc().set({
        'TimeStamp': DateTime.now(),
        'contents': contents.text,
        'Title':title.text,
        'comment' : comment,
        'like' : like,
        'see' : 0,
        'write': FirebaseAuth.instance.currentUser!.phoneNumber
      }).whenComplete(() {
        print('등록 완료');
        });
}