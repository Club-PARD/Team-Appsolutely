import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactService extends ChangeNotifier {
  List<Contact> list = [];

  Future<List<Contact>> getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      list = await ContactsService.getContacts();
    } else if (status.isDenied) {
      Permission.contacts.request();
    }

    return list;
  }

  Future<List<Contact>> searchContacts(String search) async {
    List<Contact> result =
        list.where((element) => element.displayName!.contains(search)).toList();

    return result;
  }

  Future addOne(String newValue) async {
    ///새 연락처 추가하기
    Contact newPerson = Contact();
    newPerson.givenName = newValue;
    await ContactsService.addContact(newPerson);
    list.add(newPerson);
    notifyListeners();
  }
}
