import 'package:appsolutely/Screen/home.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_text_styles.dart';

class Join2 extends StatefulWidget {
  const Join2({super.key});

  @override
  State<Join2> createState() => _Join2State();
}

class _Join2State extends State<Join2> {
  final PhoNumcontroller = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Color(0XFF8B95A1)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('본인인증이 필요해요', style: Title2Style(color: Colors.black)),
                  const SizedBox(height: 66),
                  Text('전화번호', style: Title5Style()),
                  MyTextField(
                    contents: '전화번호를 입력해주세요.',
                    controller: PhoNumcontroller,
                    onChanged: (value) {},
                    validation: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  LoginButton(
                    pressed: () {
                      authService.signInWithPhoneNumber(
                        phone: PhoNumcontroller.text,
                        onSuccess: () {
                          //  로그인 성공
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("로그인 성공"),
                          ));
                        },
                        onError: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Text('인증코드', style: Title5Style()),
                  MyTextField(
                    contents: '인증코드를 입력해주세요.',
                    controller: otpController,
                    onChanged: (value) {},
                    validation: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  LoginButton(
                    pressed: () {
                      authService.checkPINCode(
                        code: otpController.text,
                        onSuccess: () {
                          //  로그인 성공
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("로그인 성공"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        onError: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
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
