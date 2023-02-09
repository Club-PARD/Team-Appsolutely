import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<DataService>(
      builder: (context, dataService, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: const Text('연락처'),
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
              IconButton(
                onPressed: () {
                  dataService.create("dummy", user.uid);
                },
                icon: const Icon(
                  Icons.person_add_alt_1_rounded,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: dataService.read(user.uid),
                  builder: (context, snapshot) {
                    final docs = snapshot.data?.docs ?? [];
                    if (docs.isEmpty) {
                      return const Center(child: Text('데이터를 추가해주세요.'));
                    }
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        String data = doc.get('data');
                        return ListTile(
                          title: Text(
                            data,
                            style: const TextStyle(fontSize: 24),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // 삭제 버튼 클릭시
                              dataService.delete(doc.id);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
                icon: Icon(Icons.edit_rounded),
                label: '통화준비',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: '연락처',
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
        );
      },
    );
  }
}
