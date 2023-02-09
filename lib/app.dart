import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'Screen/LoginPage.dart';
import 'Screen/home.dart';

class Appsolutely extends StatelessWidget {
  const Appsolutely({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appsolutely',
        // home: user == null ? const LoginPage() : const HomePage(),
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset('assets/img/logo.png'),
            nextScreen: user == null ? const LoginPage() : const HomePage(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.white));
  }
}
