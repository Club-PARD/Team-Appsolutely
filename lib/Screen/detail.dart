import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(contact.displayName!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Hero(
              tag: contact,
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
                        '${contact.phones!.first.value}',
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
                        '${contact.company}',
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
                        '${contact.jobTitle}',
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
                        '${contact.emails!.first.value}',
                        style: Body1Style(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('통화 내역'),
          ],
        ),
      ),
    );
  }
}
