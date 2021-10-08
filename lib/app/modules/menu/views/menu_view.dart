import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyota/app/constants/app_string.dart';
import '../controllers/menu_controller.dart';
import 'widgets/menu_items.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: Get.width * 0.2,
        height: Get.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppString.kDefaultBorder),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFFB00000),
              Color(0xffb00022),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.3, 1.0],
          ),
        ),
        child: GetBuilder<MenuController>(
          init: MenuController(),
          initState: (_) {},
          builder: (_) {
            return Column(
              children: [
                ...menuItems(),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
