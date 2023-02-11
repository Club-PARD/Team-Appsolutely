import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: const [
              CommunityItem2(
                  title: '자율주행 데이터셋', thumb: 52, chat: 33, view: 256),
              CommunityItem(
                  title: '객체 인식 인공지능',
                  thumb: 66,
                  chat: 19,
                  view: 300,
                  user: '테슬라'),
              CommunityItem(
                  title: '빅데이터 기관',
                  thumb: 29,
                  chat: 31,
                  view: 125,
                  user: '오일러'),
              CommunityItem(
                  title: '데이터 라벨링 소득',
                  thumb: 39,
                  chat: 15,
                  view: 88,
                  user: '에디슨'),
              CommunityItem(
                  title: '자동차 자동 인식',
                  thumb: 16,
                  chat: 17,
                  view: 334,
                  user: '웨이모'),
              CommunityItem(
                  title: '대기업 데이터셋',
                  thumb: 37,
                  chat: 13,
                  view: 231,
                  user: '딥러닝'),
              CommunityItem(
                  title: '국민내일배움카드',
                  thumb: 34,
                  chat: 18,
                  view: 110,
                  user: '파스칼'),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityItem extends StatelessWidget {
  final String title;
  final String user;
  final int thumb;
  final int view;
  final int chat;
  const CommunityItem({
    Key? key,
    required this.title,
    required this.thumb,
    required this.view,
    required this.chat,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      user,
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Pretendard-Regular",
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '2023.01.23',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/thumb.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $thumb      ',
                    style: Theme.of(context).textTheme.bodySmall),
                Image.asset(
                  'assets/chat.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $chat      ',
                    style: Theme.of(context).textTheme.bodySmall),
                Image.asset(
                  'assets/view.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $view', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityItem2 extends StatelessWidget {
  final String title;
  final int thumb;
  final int view;
  final int chat;
  const CommunityItem2({
    Key? key,
    required this.title,
    required this.thumb,
    required this.view,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      '알파고   ',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Pretendard-Regular",
                          color: Colors.black),
                    ),
                    Image.asset(
                      'assets/Frame46.png',
                      height: 16,
                      width: 45,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '2023.01.23',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/thumb.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $thumb      ',
                    style: Theme.of(context).textTheme.bodySmall),
                Image.asset(
                  'assets/chat.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $chat      ',
                    style: Theme.of(context).textTheme.bodySmall),
                Image.asset(
                  'assets/view.png',
                  color: const Color(0xFFD7D7D7),
                ),
                Text('   $view', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
