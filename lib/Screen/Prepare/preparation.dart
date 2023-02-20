import 'package:appsolutely/service/prepare_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../service/auth_service.dart';
import '../../utils/app_text_styles.dart';
import 'detail_prepare.dart';

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

class MyPrepares extends StatelessWidget {
  const MyPrepares({
    super.key,
    required this.isSearch,
    required this.service,
  });

  final String isSearch;
  final PrepareService service;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    return isSearch == ''
        ? StreamBuilder<QuerySnapshot>(
            stream: service.read(authService.currentUser()!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final prepare = snapshot.data!.docs[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              service.delete(prepare.id);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            label: '삭제',
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Hero(
                          tag: prepare,
                          child: Image.asset('assets/img/profile.png'),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prepare.get('oneName') as String,
                              style: Body4Style(),
                            ),
                            Text(
                              '통화 예정 시각',
                              style: Body3Style(color: Colors.grey),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                prepare.get('oneCompany') as String,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                DateFormat('M월 dd일 HH:mm')
                                    .format(prepare.get('time').toDate()),
                                style:
                                    Body3Style(color: const Color(0xFF2145FF)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPreparePage(prepare, null)));
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        : StreamBuilder<QuerySnapshot>(
            stream: service.read(authService.currentUser()!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              List<DocumentSnapshot> filteredDocs = snapshot.data!.docs
                  .where((document) =>
                      document.get('oneName').toString().contains(isSearch))
                  .toList();
              return ListView.builder(
                itemCount: filteredDocs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = filteredDocs[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            service.delete(document.id);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          label: '삭제',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Hero(
                        tag: document,
                        child: Image.asset('assets/img/profile.png'),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            document.get('oneName') as String,
                            style: Body4Style(),
                          ),
                          Text(
                            '통화 예정 시각',
                            style: Body3Style(color: Colors.grey),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              document.get('oneCompany') as String,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              DateFormat('M월 dd일 HH:mm')
                                  .format(document.get('time').toDate()),
                              style: Body3Style(color: const Color(0xFF2145FF)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPreparePage(null, document)));
                      },
                    ),
                  );
                },
              );
            },
          );
  }
}
