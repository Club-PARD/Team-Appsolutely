import 'package:appsolutely/Screen/Join/Join.dart';
import 'package:appsolutely/Screen/otp.dart';
import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<String> images = [
    'assets/img/splash1.png',
    'assets/img/splash2.png'
  ];
  var country = "";
  var phone = "";
  var code = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 48, 0, 52),
                child: Column(
                  children: [
                    // CarouselSlider.builder(
                    //   itemCount: images.length,
                    //   options: CarouselOptions(
                    //     autoPlay: true,
                    //     aspectRatio: 0.83,
                    //     enlargeCenterPage: true,
                    //   ),
                    //   itemBuilder: (context, index, realIdx) {
                    //     return Container(
                    //       color: Colors.white,
                    //       child: Center(
                    //           child: Image.asset(
                    //         images[index],
                    //         fit: BoxFit.contain,
                    //         height: 560,
                    //         width: 1000,
                    //       )),
                    //     );
                    //   },
                    // ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 560,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                      items: images
                          .map((item) => Container(
                                child: Center(
                                    child: Image.asset(
                                  item,
                                  fit: BoxFit.contain,
                                  height: 560,
                                )),
                              ))
                          .toList(),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     authService.signInWithGoogle(
                    //       onSuccess: () {
                    //         // 로그인 성공
                    //         ScaffoldMessenger.of(context)
                    //             .showSnackBar(const SnackBar(
                    //           content: Text("로그인 성공"),
                    //         ));

                    //         Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const HomePage(),
                    //           ),
                    //         );
                    //       },
                    //       onError: (err) {
                    //         // 에러 발생
                    //         print(err);
                    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //           content: Text(err),
                    //         ));
                    //       },
                    //     );
                    //   },
                    //   child: Text('구글 로그인 잠시 임시용'),
                    // ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 54,
                      width: 340,
                      child: ElevatedButton(
                          onPressed: () {
                            print('회원가입 시작');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Join1()), // 회원가입 페이지로 가기
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0XFF2145FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding:
                                  const EdgeInsets.fromLTRB(75, 17, 75, 17)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Image.asset(
                                  'assets/img/call.png',
                                  height: 18.33,
                                  width: 18.33,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('전화번호로 시작하기',
                                  style: Title4Style(color: Colors.white)),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 54,
                      width: 340,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Join2()), // 회원가입 페이지로 가기
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0XFF2145FF),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.fromLTRB(66, 17, 66, 17),
                            side: const BorderSide(
                                width: 1.0, color: Color(0XFF2145FF)),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 3),
                                  Image.asset(
                                    'assets/img/Lock.png',
                                    height: 17,
                                    width: 17,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('전화번호로 로그인하기',
                                  style: Title4Style(
                                      color: const Color(0XFF2145FF))),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
