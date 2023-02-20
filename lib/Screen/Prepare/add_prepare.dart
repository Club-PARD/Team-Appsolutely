import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../service/auth_service.dart';
import '../../service/prepare_service.dart';

class AddPreparePage extends StatefulWidget {
  const AddPreparePage({super.key});

  @override
  State<AddPreparePage> createState() => _AddPreparePageState();
}

class _AddPreparePageState extends State<AddPreparePage> {
  var search = '';
  var memo = '';
  DateTime dateTime = DateTime.now();
  Contact? recipient;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final prepareService = context.read<PrepareService>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('준비하기'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Consumer<ContactService>(
                  builder: (context, contactService, _) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('수신자'),
                      const SizedBox(height: 10),
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: '전화 걸고자 하는 사람을 검색해주세요.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
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
                        onSubmitted: (value) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return FutureBuilder<List<Contact>>(
                                future: contactService.searchContacts(value),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return AlertDialog(
                                      contentPadding: const EdgeInsets.all(24),
                                      content: Builder(
                                        builder: (context) {
                                          return SizedBox(
                                            width: double.maxFinite,
                                            height: 200,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                final person =
                                                    snapshot.data![index];
                                                return ListTile(
                                                  leading: Image.asset(
                                                      'assets/img/profile.png'),
                                                  title: Text(
                                                    person.givenName!,
                                                    style: Body4Style(),
                                                  ),
                                                  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          person.company!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          person.jobTitle!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const SizedBox(),
                                                      const SizedBox(),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      recipient = person;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const Divider(),
                                              itemCount: snapshot.data!.length,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      recipient == null
                          ? const SizedBox()
                          : ListTile(
                              leading: Image.asset('assets/img/profile.png'),
                              title: Text(
                                recipient!.givenName!,
                                style: Body4Style(),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      recipient!.company!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      recipient!.jobTitle!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                      const SizedBox(height: 30),
                      const Text('날짜'),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: TimePickerSpinnerPopUp(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          initTime: dateTime,
                          barrierColor: Colors.grey,
                          timeFormat: 'yyyy-MM-dd HH:mm',
                          onChange: (p0) {
                            setState(() {
                              dateTime = p0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('메모'),
                      const SizedBox(height: 10),
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: '전화를 걸 때 알아둬야 할 정보들을 미리 입력해주세요.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                        onChanged: (value) {
                          setState(() {
                            memo = value;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      disabledForegroundColor: Colors.grey,
                      foregroundColor: const Color(0xFF2145FF),
                      side: BorderSide(
                        color: recipient == null || memo.isEmpty
                            ? Colors.grey
                            : const Color(0xFF2145FF),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: recipient == null || memo.isEmpty
                        ? null
                        : () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '전화하기',
                        style: Title5Style(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2145FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: recipient == null || memo.isEmpty
                        ? null
                        : () {
                            prepareService.create(
                              authService.currentUser()!.uid,
                              recipient!,
                              Timestamp.fromDate(dateTime),
                              memo,
                            );
                            Navigator.pop(context);
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '저장하기',
                        style: Title5Style(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
