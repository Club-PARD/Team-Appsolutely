import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

final ContentsReference = FirebaseFirestore.instance.collection('Contents');

userstart(title,contents) {
  List comment = [];
   List like = [];
   int see = 0;
    var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
  String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(now); //format변경
ContentsReference.doc().set({
  
        'TimeStamp': formatDate,
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