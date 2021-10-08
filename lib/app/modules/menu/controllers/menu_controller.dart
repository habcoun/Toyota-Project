import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyota/app/constants/app_images.dart';
import 'package:toyota/app/modules/contact/views/contact_view.dart';
import 'package:toyota/app/modules/home/views/home_view.dart';
import 'package:toyota/app/modules/map/views/map_view.dart';
import 'package:toyota/app/modules/menu/models/icon_model.dart';
import 'package:toyota/app/modules/products/views/products_view.dart';

class MenuController extends GetxController with SingleGetTickerProviderMixin {
  var currentIndex = 0;
  double itemSize = 50;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeTabIndex(int index) {
    currentIndex = index;

    if (currentIndex == 0) {
      Get.to(
        () => HomeView(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 1500,
        ),
      );
      // Get.delete<MenuController>();
    }
    if (currentIndex == 1) {
      Get.to(
        () => MapView(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 1500,
        ),
      );
      // Get.delete<MenuController>();
    }
    if (currentIndex == 2) {
      Get.to(
        () => ProductsView(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 1500,
        ),
      );
      // Get.delete<MenuController>();
    }
    if (currentIndex == 3) {
      Get.to(
        () => ContactView(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 1500,
        ),
      );
      // Get.delete<MenuController>();
    }

    update();
    print('currentIndex = $currentIndex');
    print('index = $index');
  }

  List<IconModel> icons = [
    IconModel(
      color: Colors.white,
      image: AppImage.kMenuIcon,
      weight: 22,
    ),
    IconModel(
      color: Colors.white,
      image: AppImage.kMenuCard,
      weight: 30,
    ),
    IconModel(
      color: Colors.white,
      image: AppImage.kMenuCar,
      weight: 55,
    ),
    IconModel(
      color: Colors.white,
      image: AppImage.kMenuContact,
      weight: 32,
    ),
  ];
}
