import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactService = context.read<ContactService>();
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
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
              TextField(
                controller: nameController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '이름을 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '휴대전화 번호',
                style: Body1Style(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '번호를 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '회사/부서',
                style: Body1Style(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: companyController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '소속된 회사와 부서를 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '직책',
                style: Body1Style(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: jobController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '부서에서의 직책을 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '이메일',
                style: Body1Style(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '이메일을 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
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
                        contactService.addOne(
                          name: nameController.text,
                          company: companyController.text,
                          phone: phoneController.text,
                          job: jobController.text,
                          email: emailController.text,
                        );
                        Navigator.pop(context);
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
    );
  }
}
