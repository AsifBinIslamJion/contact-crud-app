import 'package:crud_app/controllers/contact_controller.dart';
import 'package:crud_app/src/pages/contact_form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactHomePage extends StatelessWidget {
  ContactHomePage({super.key});

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text('Contact list'),
      ),

      body: Obx(() {
        if (controller.contactlist.isEmpty) {
          return Center(
            child: Text(
              'No contacts available. \nPlease add some Contacts',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.contactlist.length,

          itemBuilder: (context, index) {
            final contact = controller.contactlist[index];

            return Card(
              child: ListTile(
                title: Text(
                  'Name: ${contact.name}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profession: ${contact.profession}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Mobile: ${contact.mobile}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => ContactFormPage(index: index));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text('Delete Contact'),
                                content: Text(
                                  'Are you sure want to delete this contact?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.deleteContact(index);
                                      Get.back();
                                      Get.snackbar(
                                        'Success',
                                        "Contact deleted successfully",
                                      );
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ContactFormPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
