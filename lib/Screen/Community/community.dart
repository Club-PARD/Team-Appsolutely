import 'package:appsolutely/utils/app_text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Contents')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Text(
                        '  업로드 된\n글이 없어요 :(',
                        style: Title3Style(color: const Color(0XFFF4F7FC)),
                      ));
                    }
                    return SizedBox(
                      height: 1000,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: BoxDecoration(
                                    color: const Color(0XFFF4F7FC),
                                    borderRadius: BorderRadius.circular(15)),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 12, 20, 9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              snapshot.data!.docs[index]
                                                  ['write'],
                                              style: Body3Style(
                                                  color: Colors.black)),
                                          Text(
                                              snapshot.data!.docs[index]
                                                  ['TimeStamp'],
                                              style: Body3Style(
                                                  color: Colors.grey)),
                                        ]),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(snapshot.data!.docs[index]['Title'],
                                        style:
                                            Title4Style(color: Colors.black)),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        // SizedBox(height: 4, width: 13, child: IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up))),
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: 1,
                                                child: IconButton(
                                                    iconSize: 13,
                                                    constraints:
                                                        const BoxConstraints(),
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.thumb_up,
                                                      color: Colors.grey,
                                                    ))),
                                            const SizedBox(
                                              height: 13,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                            snapshot.data!.docs[index]['like']
                                                .length
                                                .toString(),
                                            style:
                                                Body3Style(color: Colors.grey)),
                                        const SizedBox(width: 38),
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: 1,
                                                child: IconButton(
                                                    iconSize: 13,
                                                    constraints:
                                                        const BoxConstraints(),
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.chat_bubble,
                                                      color: Colors.grey,
                                                    ))),
                                            const SizedBox(
                                              height: 13,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                            snapshot.data!
                                                .docs[index]['comment'].length
                                                .toString(),
                                            style:
                                                Body3Style(color: Colors.grey)),
                                        const SizedBox(width: 38),
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: 1,
                                                child: IconButton(
                                                    iconSize: 13,
                                                    constraints:
                                                        const BoxConstraints(),
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color: Colors.grey,
                                                    ))),
                                            const SizedBox(
                                              height: 13,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                            snapshot.data!.docs[index]['see']
                                                .toString(),
                                            style:
                                                Body3Style(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
