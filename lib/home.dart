import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<DataService>(
      builder: (context, dataService, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${user.displayName}님 환영합니다!'),
            actions: [
              IconButton(
                onPressed: () {
                  dataService.create("dummy", user.uid);
                },
                icon: const Icon(Icons.add),
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
              ElevatedButton(
                onPressed: () {
                  authService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  '로그아웃',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
