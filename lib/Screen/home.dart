import 'package:appsolutely/Screen/call_manner.dart';
import 'package:appsolutely/Screen/community.dart';
import 'package:appsolutely/Screen/preparation.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/contact_service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/prepare_service.dart';
import 'LoginPage.dart';
import 'add.dart';
import 'community_addPage.dart';
import 'contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final List<String> titles = ['통화기록', '연락처', '통화준비', '전화예절', '커뮤니티'];
  final List<Widget> pages = [
    const CallLogPage(),
    const ContactsPage(),
    const CallPreparationPage(),
    const CallMannerPage(),
    const CommunityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final prepareService = context.read<PrepareService>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(titles[_currentIndex]),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
          onPressed: () {
            authService.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        actions: [
          _currentIndex == 1
              ? Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPage()),
                      );
                    },
                    icon: const Icon(
                      Icons.person_add_alt_1_rounded,
                      color: Colors.grey,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0XFF2145FF),
        iconSize: 30,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_rounded),
            label: '통화기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '연락처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_rounded),
            label: '통화준비',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available_rounded),
            label: '전화예절',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate_rounded),
            label: '커뮤니티',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 2
          ? SizedBox(
              width: 85,
              height: 85,
              child: Consumer<ContactService>(
                  builder: (context, contactService, _) {
                return FutureBuilder<List<Contact>>(
                    future: contactService.getPermission(),
                    builder: (context, snapshot) {
                      return FloatingActionButton(
                        onPressed: () {
                          prepareService.create(
                              authService.currentUser()!.uid,
                              snapshot.data![0],
                              '2월 12일 오전 11:00',
                              '으아아ㅏ아ㅏㅏㅏ\n해커톤 화이팅읻아아ㅏㅏ아\n다들 수고가 많아요어어\n\n이런 노트 저런 노트 다 적어보자자ㅏ아ㅏㅏㅏ');
                        },
                        backgroundColor: const Color(0xFF617BFF),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.edit),
                              Text('준비하기'),
                            ],
                          ),
                        ),
                      );
                    });
              }),
            )
          : _currentIndex == 4
              ? SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CADDPage()),
                        );
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Transform.scale(
                          scale: 2.2,
                          child: Transform.translate(
                            offset: const Offset(0, 0),
                            child: Image.asset(
                              'assets/img/plus.png',
                              height: 11,
                              width: 11,
                            ),
                          )),
                    ),
                  ),
                )
              : null,
    );
  }
}

class CallLogPage extends StatefulWidget {
  const CallLogPage({super.key});

  @override
  State<CallLogPage> createState() => _CallLogPageState();
}

class _CallLogPageState extends State<CallLogPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('통화기록 페이지입니다'),
    );
  }
}

// class PhoneBookPage extends StatelessWidget {
//   const PhoneBookPage({
//     super.key,
//     required this.user,
//     required this.dataService,
//   });

//   final User user;
//   final DataService dataService;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: dataService.read(user.uid),
//             builder: (context, snapshot) {
//               final docs = snapshot.data?.docs ?? [];
//               if (docs.isEmpty) {
//                 return const Center(child: Text('데이터를 추가해주세요.'));
//               }
//               return ListView.builder(
//                 itemCount: docs.length,
//                 itemBuilder: (context, index) {
//                   final doc = docs[index];
//                   String data = doc.get('data');
//                   return ListTile(
//                     title: Text(
//                       data,
//                       style: const TextStyle(fontSize: 24),
//                     ),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         // 삭제 버튼 클릭시
//                         dataService.delete(doc.id);
//                       },
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }