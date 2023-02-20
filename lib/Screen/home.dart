import 'package:appsolutely/Screen/CallManner/call_manner.dart';
import 'package:appsolutely/Screen/Prepare/add_prepare.dart';
import 'package:appsolutely/Screen/Prepare/preparation.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/log_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../service/prepare_service.dart';
import 'Community/community.dart';
import 'Join/LoginPage.dart';
import 'Contacts/add.dart';
import 'Community/community_addPage.dart';
import 'Contacts/contacts.dart';
import 'detail_log.dart';

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
        leading: TextButton(
          child: Text(
            '로그아웃',
            style: Caption2Style(color: Colors.black),
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
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.grey,
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
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPreparePage()),
                  );
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
              ),
            )
          : _currentIndex == 4
              ? SizedBox(
                  height: 85,
                  width: 85,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CADDPage()),
                        );
                      },
                      backgroundColor: const Color(0xFF617BFF),
                      child: Transform.scale(
                        scale: 2.2,
                        child: Transform.translate(
                          offset: const Offset(0, 0),
                          child: Image.asset(
                            'assets/img/plus.png',
                            height: 11,
                            width: 11,
                          ),
                        ),
                      ),
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
  var search = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<LogService>(
        builder: (context, logService, _) {
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
              Expanded(
                child: MyLogs(
                  isSearch: search,
                  service: logService,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyLogs extends StatelessWidget {
  const MyLogs({
    super.key,
    required this.isSearch,
    required this.service,
  });

  final String isSearch;
  final LogService service;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    return isSearch == ''
        ? StreamBuilder<QuerySnapshot>(
            stream: service.read(authService.currentUser()!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final log = snapshot.data!.docs[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              service.delete(log.id);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            label: '삭제',
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: log.get('type') == null
                            ? Image.asset('assets/img/missed.png')
                            : log.get('type') == true
                                ? Image.asset('assets/img/callout.png')
                                : Image.asset('assets/img/callback.png'),
                        title: Text(
                          log.get('oneName') as String,
                          style: Body4Style(),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                log.get('type') == null
                                    ? '부재중 전화'
                                    : log.get('type') == true
                                        ? '발신 통화'
                                        : '수신 통화',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                DateFormat('M월 dd일 HH:mm')
                                    .format(log.get('time').toDate()),
                                style: const TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailLogPage(log, null)),
                          );
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        : StreamBuilder<QuerySnapshot>(
            stream: service.read(authService.currentUser()!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              List<DocumentSnapshot> filteredDocs = snapshot.data!.docs
                  .where((document) =>
                      document.get('oneName').toString().contains(isSearch))
                  .toList();
              return ListView.builder(
                itemCount: filteredDocs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot log = filteredDocs[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            service.delete(log.id);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          label: '삭제',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: log.get('type') == null
                          ? Image.asset('assets/img/missed.png')
                          : log.get('type') == true
                              ? Image.asset('assets/img/callout.png')
                              : Image.asset('assets/img/callback.png'),
                      title: Text(
                        log.get('oneName') as String,
                        style: Body4Style(),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              log.get('type') == null
                                  ? '부재중 전화'
                                  : log.get('type') == true
                                      ? '발신 통화'
                                      : '수신 통화',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              DateFormat('M월 dd일 HH:mm')
                                  .format(log.get('time').toDate()),
                              style: const TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailLogPage(null, log)),
                        );
                      },
                    ),
                  );
                },
              );
            },
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