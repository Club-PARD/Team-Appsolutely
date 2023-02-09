import 'package:appsolutely/Screen/call_manner.dart';
import 'package:appsolutely/Screen/community.dart';
import 'package:appsolutely/Screen/preparation.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';
import 'contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final List<String> titles = ['통화기록', '연락처', '통화준비', '전화예절', '커뮤니티'];

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<DataService>(
      builder: (context, dataService, _) {
        final List<Widget> pages = [
          const CallLogPage(),
          const ContactsPage(),
          const CallPreparationPage(),
          const CallMannerPage(),
          const CommunityPage(),
        ];
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
                  ? IconButton(
                      onPressed: () {
                        dataService.create("dummy", user.uid);
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
        );
      },
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
