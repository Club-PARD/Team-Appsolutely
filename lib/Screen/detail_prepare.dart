import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPreparePage extends StatelessWidget {
  const DetailPreparePage({
    super.key,
    required this.prepare,
  });

  final QueryDocumentSnapshot prepare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(prepare.get('oneName') as String),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
