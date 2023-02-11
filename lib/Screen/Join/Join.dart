import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/widget.dart';

class Join1 extends StatefulWidget {
  const Join1({super.key});

  @override
  State<Join1> createState() => _Join1State();
}

class _Join1State extends State<Join1> {
  final formKey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final birthcontroller = TextEditingController();
  final phoneNumcontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  String _nameText = '';
  String _birthText = '';
  String _phoneNumText = '';
  String _genderText = '';

  void _updateNameText(String value) {
    setState(() {
      _nameText = value;
    });
  }

  void _updateBirthText(String value) {
    setState(() {
      _birthText = value;
    });
  }

  void _updatePhoneNumText(String value) {
    setState(() {
      _phoneNumText = value;
    });
  }

  void _updategenderText(String value) {
    setState(() {
      _genderText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0XFF8B95A1)),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('본인인증이 필요해요', style: Title2Style(color: Colors.black)),
                const SizedBox(height: 66),
                Text('이름', style: Title5Style()),
                MyTextField(
                  contents: '이름을 입력해주세요.',
                  controller: namecontroller,
                  onChanged: _updateNameText,
                  validation: (value) {
                    if (value!.length < 2) {
                      return '이름을 2글자 이상 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                Text('주민등록번호', style: Title5Style()),
                Row(
                  children: [
                    SizedBox(
                      width: 161,
                      child: Flexible(
                        child: MyTextField(
                          contents: '생년월일',
                          controller: birthcontroller,
                          onChanged: _updateBirthText,
                          validation: (value) {
                            if (value!.length != 6) {
                              return '생년월일을 정확히 입력하세요.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 18,
                      child: Flexible(
                        child: MyWidget().TextFieldCenter(
                          '0',
                          gendercontroller,
                          _updategenderText,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 14),
                    MyWidget().Dot(),
                    const SizedBox(width: 35),
                  ],
                ),
                const SizedBox(height: 50),
                Text('휴대폰 번호', style: Title5Style()),
                Row(
                  children: [
                    Column(
                      children: const [
                        SizedBox(height: 15),
                        SizedBox(width: 102, child: DropdownButtonCode()),
                      ],
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 220,
                      child: Flexible(
                        child: MyTextField(
                          contents: ' 휴대폰 번호를 입력해주세요.',
                          controller: phoneNumcontroller,
                          onChanged: _updatePhoneNumText,
                          validation: (value) {
                            if (!RegExp(
                                    r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{4})[-. ]*(\d{4})(?: *x(\d+))?\s*$")
                                .hasMatch(value!)) {
                              return '전화번호를 정확히 입력하세요.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nameText.isEmpty ||
                            _birthText.isEmpty ||
                            _phoneNumText.isEmpty ||
                            _genderText.isEmpty
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {}
                          },
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: _nameText.isNotEmpty &&
                                  _birthText.isNotEmpty &&
                                  _phoneNumText.isNotEmpty &&
                                  _genderText.isNotEmpty
                              ? const Color(0XFF2145FF)
                              : const Color(0XFFC0C0C0),
                        ),
                        foregroundColor: const Color(0XFF2145FF),
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.fromLTRB(75, 17, 75, 17)),
                    child: Text('인증 요청', style: Title4Style()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
