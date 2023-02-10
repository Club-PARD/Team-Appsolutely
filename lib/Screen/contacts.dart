import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';
import '../utils/widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  var search = '';

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<ContactService>(builder: (context, contactService, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: '이름, 프로젝트 등을 검색해보세요.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                prefixIconColor: Colors.grey,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
            const SizedBox(height: 30),
            const Text('내 프로필'),
            ListTile(
              leading: user.photoURL == null
                  ? Image.asset('assets/img/profile.png')
                  : Image.network(user.photoURL!),
              title: Text(
                user.displayName == null ? '사용자' : user.displayName!,
                style: Body4Style(),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('한동대학교'),
                  Text('프로젝트 팀장'),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 15),
            const Text('연락처'),
            Expanded(
              child: search == ''
                  ? MyContacts(future: contactService.getPermission())
                  : MyContacts(future: contactService.searchContacts(search)),
            ),
          ],
        );
      }),
    );
  }
}
