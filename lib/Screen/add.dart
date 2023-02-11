import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/widget.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactService = context.read<ContactService>();
    final formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var companyController = TextEditingController();
    var jobController = TextEditingController();
    var emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text('연락처 추가'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: Transform.scale(
                      scale: 2,
                      child: Image.asset('assets/img/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  '이름',
                  style: Body1Style(),
                ),
                const SizedBox(height: 10),
                AddTextFormField(
                  controller: nameController,
                  hint: '이름을 입력해주세요.',
                  validation: (value) {
                    if (value!.isEmpty) {
                      return '이름을 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  '휴대전화 번호',
                  style: Body1Style(),
                ),
                const SizedBox(height: 10),
                AddTextFormField(
                  controller: phoneController,
                  hint: '번호를 입력해주세요.',
                  validation: (value) {
                    if (value!.isEmpty) {
                      return '전화번호를 입력하세요.';
                    } else if (!RegExp(
                            r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{4})[-. ]*(\d{4})(?: *x(\d+))?\s*$")
                        .hasMatch(value)) {
                      return '전화번호를 정확히 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  '회사/부서',
                  style: Body1Style(),
                ),
                const SizedBox(height: 10),
                AddTextFormField(
                  controller: companyController,
                  hint: '소속된 회사와 부서를 입력하세요.',
                  validation: (value) {
                    if (value!.isEmpty) {
                      return '소속된 회사와 부서를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  '직책',
                  style: Body1Style(),
                ),
                const SizedBox(height: 10),
                AddTextFormField(
                  controller: jobController,
                  hint: '부서에서의 직책을 입력해주세요.',
                  validation: (value) {
                    if (value!.isEmpty) {
                      return '부서에서의 직책을 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  '이메일',
                  style: Body1Style(),
                ),
                const SizedBox(height: 10),
                AddTextFormField(
                  controller: emailController,
                  hint: '이메일을 입력해주세요.',
                  validation: (value) {
                    if (value!.isEmpty) {
                      return '이메일을 입력하세요.';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                        .hasMatch(value)) {
                      return '이메일을 정확히 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(54),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '취소',
                          style: Title5Style(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(54),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            contactService.addOne(
                              name: nameController.text,
                              company: companyController.text,
                              phone: phoneController.text,
                              job: jobController.text,
                              email: emailController.text,
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          '저장',
                          style: Title5Style(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
