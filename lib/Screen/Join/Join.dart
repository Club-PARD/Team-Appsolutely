import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_text_styles.dart';

class Join1 extends StatefulWidget {
   Join1({super.key});

  @override
  State<Join1> createState() => _Join1State();
  
}

class _Join1State extends State<Join1> {
      final namecontroller = TextEditingController();
    final registNumcontroller = TextEditingController();
    final PhoNumcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('본인인증이 필요해요',style: Title2Style(color:Colors.black)),
             SizedBox(height: 66),
             Text('이름',style: Title5Style()),
             _TextField('이름을 입력해주세요.',namecontroller),
              SizedBox(height: 50),
              Text('주민등록번호',style: Title5Style()),
          ]
        ),
      ),
    );
  }
  Widget _TextField(_contents,_controller){
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _contents,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
      ),
    );
  }
}