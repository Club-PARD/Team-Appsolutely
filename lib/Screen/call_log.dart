import 'package:flutter/material.dart';

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
