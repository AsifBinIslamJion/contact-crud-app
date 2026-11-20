import 'package:crud_app/controllers/contact_controller.dart';
import 'package:crud_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactFormPage extends StatelessWidget {
  final int? index;
  ContactFormPage({super.key, this.index});

  final controller = Get.find<ContactController>();

  final nameController = TextEditingController();
  final professionController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (index != null && nameController.text.isEmpty) {
      final contact = controller.contactlist[index!];

      nameController.text = contact.name!;
      professionController.text = contact.profession!;
      mobileController.text = contact.mobile!;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              index == null ? 'Add your Contact' : 'Update your Contact',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text('Enter name'),
              ),
            ),
            SizedBox(height: 15),

            TextField(
              controller: professionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text('Profession'),
              ),
            ),
            SizedBox(height: 15),

            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text('Enter Number'),
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  ContactModel contact = ContactModel(
                    name: nameController.text,
                    profession: professionController.text,
                    mobile: mobileController.text,
                  );

                  if (index == null) {
                    controller.addContact(contact);
                  } else {
                    controller.updateContact(index!, contact);
                  }
                },

                child: Text(index == null ? 'Save' : 'Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
