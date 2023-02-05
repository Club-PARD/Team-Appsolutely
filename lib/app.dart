import 'package:appsolutely/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login.dart';

class Appsolutely extends StatelessWidget {
  const Appsolutely({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appsolutely',
      home: user == null ? const LoginPage() : const HomePage(),
    );
  }
}
