import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  Future<List<Contact>> getPermission() async {
    List<Contact> contacts = [];

    var status = await Permission.contacts.status;
    if (status.isGranted) {
      contacts = await ContactsService.getContacts();
    } else if (status.isDenied) {
      Permission.contacts.request();
    }

    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Contact>>(
            future: getPermission(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('$index')),
                      title: Text(snapshot.data![index].displayName!),
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
