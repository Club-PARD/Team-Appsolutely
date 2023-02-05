import 'package:appsolutely/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 50),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      authService.signInWithGoogle(
                        onSuccess: () {
                          // 로그인 성공
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("로그인 성공"),
                          ));

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/project-e3738.appspot.com/o/source%2Fgoogle_logo.png?alt=media&token=adb498a0-1dfb-4eee-a8c6-d2fea2455f73',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const Text('GOOGLE'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
