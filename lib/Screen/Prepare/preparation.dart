import 'package:appsolutely/service/prepare_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widget.dart';

class CallPreparationPage extends StatefulWidget {
  const CallPreparationPage({super.key});

  @override
  State<CallPreparationPage> createState() => _CallPreparationPageState();
}

class _CallPreparationPageState extends State<CallPreparationPage> {
  var search = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<PrepareService>(
        builder: (context, prepareService, _) {
          return Column(
            children: [
              TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: '이름, 프로젝트 등을 검색해보세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  prefixIconColor: Colors.grey,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              Expanded(
                child: MyPrepares(isSearch: search, service: prepareService),
              ),
            ],
          );
        },
      ),
    );
  }
}
