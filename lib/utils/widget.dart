import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class MyTextField extends StatelessWidget {
  final String contents;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.contents,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 10),
        hintText: contents,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFC0C0C0)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintStyle: Body1Style(),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final void Function() pressed;

  const LoginButton({
    super.key,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0XFF2145FF),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.fromLTRB(66, 17, 66, 17),
        side: const BorderSide(width: 1.0, color: Color(0XFF2145FF)),
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
          const SizedBox(width: 10),
          Text(
            '전화번호로 로그인하기',
            style: Title4Style(color: const Color(0XFF2145FF)),
          ),
        ],
      ),
    );
  }
}

class MyWidget {
  
  Widget Dot(){
    return  Column(
      children: [
        SizedBox(height: 10,),
        Image.asset('assets/img/Dot.png',height: 4, width: 4),
      ],
    );
  }

  Widget TextFieldCenter(contents,controller){
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: contents,
        contentPadding: EdgeInsets.only(top: 10),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFC0C0C0)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintStyle: Body1Style(),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
      ),
    );
  }

   
}

List<String> list = <String>['SKT', 'KT', 'LG U+', '알뜰폰'];
class DropdownButtonCode extends StatefulWidget {
  const DropdownButtonCode({super.key});

  @override
  State<DropdownButtonCode> createState() => _DropdownButtonCodeState();
}

class _DropdownButtonCodeState extends State<DropdownButtonCode> {
  String dropdownValue = list.first;
  final List<String> _valueList = ['통신사        ','SKT', 'KT', 'LG U+', '알뜰폰'];
  String _selectedValue = '통신사';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
          value: _valueList.first,
          // style: Body1Style(color: Colors.black),
          items: _valueList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              print(value);
              _selectedValue = value.toString();
            });
          },
        );
  }
}