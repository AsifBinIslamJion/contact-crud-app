import 'package:crud_app/controllers/contact_controller.dart';
import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import 'src/app.dart';

void main() {
  Get.put(ContactController());
  runApp(const App());
}
