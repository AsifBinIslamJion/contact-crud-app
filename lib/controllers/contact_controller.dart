import 'package:crud_app/models/contact_model.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxList<ContactModel> contactlist = <ContactModel>[].obs;

  void addContact(ContactModel contact) {
    contactlist.add(contact);
    Get.back();
    Get.snackbar('Success', 'Your contact added Successfully');
  }

  void updateContact(int index, ContactModel contact) {
    contactlist[index] = contact;
    Get.back();
    Get.snackbar('Success', 'Your contact updated Successfully');
  }

  void deleteContact(int index) {
    contactlist.removeAt(index);
    Get.snackbar('Success', 'Your contact updated Successfully');
  }
}
