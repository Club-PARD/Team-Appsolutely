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
    return list
        .where((element) => element.displayName!.contains(search))
        .toList();
  }

  Future<Contact> getContact(Contact contact) async {
    Contact result = list[list
        .indexWhere((element) => element.identifier! == contact.identifier!)];
    print(result);
    return result;
  }

  Future addOne({
    required String name,
    required String company,
    required String phone,
    required String job,
    required String email,
  }) async {
    ///새 연락처 추가하기
    Contact newPerson = Contact();
    newPerson.identifier = list.length.toString();
    newPerson.givenName = name;
    newPerson.company = company;
    newPerson.phones = [];
    newPerson.phones!.add(Item(label: 'Mobile', value: phone));
    newPerson.jobTitle = job;
    newPerson.emails = [];
    newPerson.emails!.add(Item(label: 'Home', value: email));
    await ContactsService.addContact(newPerson);
    list.add(newPerson);
    notifyListeners();
  }

  Future deleteOne(Contact contact) async {
    await ContactsService.deleteContact(contact);
    list.remove(contact);
    notifyListeners();
  }

  Future updateOne({
    required Contact contact,
  }) async {
    await ContactsService.updateContact(contact);
    list[list.indexWhere(
        (element) => element.identifier! == contact.identifier)] = contact;
    notifyListeners();
  }
}
