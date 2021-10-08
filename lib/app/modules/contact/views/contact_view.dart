import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toyota/app/modules/menu/views/menu_view.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MenuView(),
          ],
        ),
      ),
    );
  }
}
