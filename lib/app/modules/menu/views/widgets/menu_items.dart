import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/menu/controllers/menu_controller.dart';

List<Widget> menuItems() {
  MenuController controller = Get.find();
  return controller.icons.map(
    (item) {
      final int index = controller.icons.indexOf(item);
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppString.kDefaultSpacing * 0.8,
          horizontal: AppString.kDefaultSpacing * 0.5,
        ),
        child: GestureDetector(
          onTap: () {
            controller.changeTabIndex(index);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              GetBuilder<MenuController>(
                init: MenuController(),
                initState: (_) {},
                builder: (_) {
                  return AnimatedContainer(
                    alignment: Alignment.center,
                    width: controller.itemSize,
                    height: controller.itemSize,
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    transform: Matrix4.translationValues(0, 0, 0)
                      ..scale(
                        controller.currentIndex != index ? 0.01 : 1.0,
                      ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppString.kDefaultBorder / 2,
                      ),
                      color: Colors.white.withOpacity(0.3),
                    ),
                  );
                },
              ),
              SvgPicture.asset(
                item.image!,
                height: item.weight,
                width: item.weight,
                color: item.color,
              )
            ],
          ),
        ),
      );
    },
  ).toList();
}
