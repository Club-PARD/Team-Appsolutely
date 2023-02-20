import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../service/auth_service.dart';
import 'detail.dart';

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
      child: Consumer<ContactService>(
        builder: (context, contactService, _) {
          return Column(
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
              search == ''
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('내 프로필'),
                        ListTile(
                          leading: user.photoURL == null
                              ? Image.asset('assets/img/profile.png')
                              : Image.network(user.photoURL!),
                          title: Text(
                            user.displayName == null
                                ? '사용자'
                                : user.displayName!,
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
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                child: MyContacts(isSearch: search, service: contactService),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyContacts extends StatelessWidget {
  const MyContacts({
    super.key,
    required this.isSearch,
    required this.service,
  });

  final String isSearch;
  final ContactService service;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: isSearch == ''
          ? service.getPermission()
          : service.searchContacts(isSearch),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final person = snapshot.data![index];
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        service.deleteOne(person);
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      label: '삭제',
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Hero(
                    tag: person,
                    child: Image.asset('assets/img/profile.png'),
                  ),
                  title: Text(
                    person.givenName!,
                    style: Body4Style(),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          person.company!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          person.jobTitle!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              contact: person,
                              service: service,
                            )),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
