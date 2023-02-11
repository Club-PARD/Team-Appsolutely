import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CallMannerPage extends StatefulWidget {
  const CallMannerPage({super.key});

  @override
  State<CallMannerPage> createState() => _CallMannerPageState();
}

class _CallMannerPageState extends State<CallMannerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '신입 사원들을 위한 필수 우리말 어휘',
                  style: Title5Style(),
                ),
                Text(
                  '헷갈리고 어려운 단어 퀴즈를 통해 알아보자',
                  style: Body2Style(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '학습 컨텐츠',
                  style: Title5Style(),
                ),
                Text(
                  '전화 문화 영상으로 한눈에 알아보자',
                  style: Body2Style(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '스피치 훈련',
                  style: Title5Style(),
                ),
                Text(
                  '떨리는 전화, 미리 말하면서 준비하자',
                  style: Body2Style(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '커뮤니티',
                  style: Title5Style(),
                ),
                Text(
                  '회사, 전화 경험에 대해 얘기해보자',
                  style: Body2Style(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
