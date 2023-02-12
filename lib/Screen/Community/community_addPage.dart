import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../service/add_community.dart';

class CADDPage extends StatefulWidget {
  const CADDPage({super.key});

  @override
  State<CADDPage> createState() => _CADDPageState();
}

class _CADDPageState extends State<CADDPage> {
  final Titlecontroller = TextEditingController();
  final Contentscontroller = TextEditingController();
  String _Title = '';
  String _Contents = '';
  final formKey = GlobalKey<FormState>();

  void _updateNameText(String value) {
    setState(() {
      _Title = value;
    });
  }

  void _update_ContentsText(String value) {
    setState(() {
      _Contents = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF8B95A1),
            ),
          ),
          title: Text(
            '글 작성',
            style: Title4Style(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        '제목',
                        style: Body1Style(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      width: 342.0,
                      height: 59.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E2E2),
                        ),
                      ),
                      child: TextField(
                        controller: Titlecontroller,
                        onChanged: _updateNameText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Body2Style(),
                          hintText: '글 제목을 입력해주세요.',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        '본문',
                        style: Body1Style(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      width: 342.0,
                      height: 437.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E2E2),
                        ),
                      ),
                      child: TextField(
                        controller: Contentscontroller,
                        onChanged: _update_ContentsText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Body2Style(),
                          hintText:
                              '본문 글을 입력해주세요. \n비방, 욕설, 음란 내용이 들어간 글은 \n관리자에 의해 삭제될 수 있습니다. \n\n커뮤니티 에티켓을 지켜주세요 :)',
                        ),
                      ),
                    ),
                    const SizedBox(height: 41),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          userstart(Titlecontroller, Contentscontroller);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 1.0,
                              color: _Title.isNotEmpty && _Contents.isNotEmpty
                                  ? const Color(0XFF2145FF)
                                  : const Color(0XFFC0C0C0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                _Title.isNotEmpty && _Contents.isNotEmpty
                                    ? const Color(0XFF2145FF)
                                    : const Color(0XFFC0C0C0),
                            disabledBackgroundColor: const Color(0XFFC0C0C0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.fromLTRB(75, 17, 75, 17)),
                        child: Text('작성 하기', style: Title4Style()),
                      ),
                    )
                  ])),
        ));
  }
}
