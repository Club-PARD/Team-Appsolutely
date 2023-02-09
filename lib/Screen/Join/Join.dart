import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/widget.dart';

class Join1 extends StatefulWidget {
  const Join1({super.key});

  @override
  State<Join1> createState() => _Join1State();
}

class _Join1State extends State<Join1> {
  final namecontroller = TextEditingController();
  final registNumcontroller = TextEditingController();
  final PhoNumcontroller = TextEditingController();
  final gendercontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('본인인증이 필요해요', style: Title2Style(color: Colors.black)),
            const SizedBox(height: 66),
            Text('이름', style: Title5Style()),
            MyTextField(contents: '이름을 입력해주세요.', controller: namecontroller),
            const SizedBox(height: 50),
            Text('주민등록번호', style: Title5Style()),
             Row(children: [
                 Flexible(child: MyTextField(contents: '생년월일', controller: registNumcontroller)),
                 SizedBox(width: 20),
                 Flexible(child: MyTextField(contents: '0', controller: gendercontroller)),
                 SizedBox(width: 14),
                //  MyWidget().Dot()
                Image.asset('assets/img/Dot.png')
              ],),
          ],
        ),
      ),
    );
  }
}
