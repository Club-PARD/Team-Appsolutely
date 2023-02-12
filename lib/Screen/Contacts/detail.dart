import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'edit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.contact,
    required this.service,
  });

  final Contact contact;
  final ContactService service;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.service.getContact(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.contact.displayName!),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage(contact: widget.contact)),
              );
            },
            icon: const Icon(
              Icons.edit_square,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Hero(
              tag: widget.contact,
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
                        '${widget.contact.phones!.first.value}',
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
                        '${widget.contact.company}',
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
                        '${widget.contact.jobTitle}',
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
                        '${widget.contact.emails!.first.value}',
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
