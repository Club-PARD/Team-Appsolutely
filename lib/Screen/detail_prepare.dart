import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class DetailPreparePage extends StatelessWidget {
  DetailPreparePage(this.prepare1, this.prepare2, {super.key});

  QueryDocumentSnapshot? prepare1;
  DocumentSnapshot? prepare2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(prepare2 == null
            ? prepare1!.get('oneName') as String
            : prepare2!.get('oneName') as String),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Hero(
              tag: prepare2 == null ? prepare1! : prepare2!,
              child: SizedBox(
                width: 90,
                height: 90,
                child: Transform.scale(
                  scale: 2,
                  child: Image.asset('assets/img/profile.png'),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FC),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '휴대전화 ',
                        style: Title4Style(color: Colors.grey),
                      ),
                      Text(
                        prepare2 == null
                            ? prepare1!.get('onePhone') as String
                            : prepare2!.get('onePhone') as String,
                        style: Title4Style(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          foregroundColor: const Color(0xFF2145FF),
                          padding: const EdgeInsets.all(15),
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF2145FF),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.call,
                          size: 20,
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          foregroundColor: const Color(0xFF2145FF),
                          padding: const EdgeInsets.all(15),
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF2145FF),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.chat_bubble,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FC),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '회사/소속',
                        style: Body1Style(color: Colors.grey),
                      ),
                      Text(
                        prepare2 == null
                            ? prepare1!.get('oneCompany') as String
                            : prepare2!.get('oneCompany') as String,
                        style: Body1Style(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '직책',
                        style: Body1Style(color: Colors.grey),
                      ),
                      Text(
                        prepare2 == null
                            ? prepare1!.get('oneJob') as String
                            : prepare2!.get('oneJob') as String,
                        style: Body1Style(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이메일',
                        style: Body1Style(color: Colors.grey),
                      ),
                      Text(
                        prepare2 == null
                            ? prepare1!.get('oneEmail') as String
                            : prepare2!.get('oneEmail') as String,
                        style: Body1Style(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('날짜'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  prepare2 == null
                      ? prepare1!.get('time') as String
                      : prepare2!.get('time') as String,
                  style: Title5Style(color: const Color(0xFF617BFF)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text('메모'),
            const SizedBox(height: 10),
            Container(
              height: 135,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                prepare2 == null
                    ? prepare1!.get('memo') as String
                    : prepare2!.get('memo') as String,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
