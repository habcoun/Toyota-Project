import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toyota/app/data/car_api.dart';
import 'package:toyota/app/modules/products/models/car_model.dart';
import 'package:toyota/app/utils/infinity_page_view.dart';

class ProductsController extends GetxController {
  final infinityPageController = new InfinityPageController();

  List<ImageProvider> imageList = <ImageProvider>[];
  bool imagePrecached = false;
  bool load = false;

  List<String>? carDemoList = [
    'https://msnautosblob.akamaized.net/izmo-prod/izmo360/en-us/2019/toyota/camry/ext360/angle',
    'https://msnautosblob.akamaized.net/izmo-prod/izmo360/en-us/2015/toyota/corolla/ext360/angle',
    'https://msnautosblob.akamaized.net/izmo-prod/izmo360/en-us/2015/toyota/land%20cruiser/ext360/angle'
  ];
  List<Car> carList = <Car>[];
  var carIndex = 0;

  @override
  void onInit() {
    getCarfromApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    infinityPageController.dispose();
  }

  void getCarfromApi() async {
    CarApi.getCar().then(
      (response) {
        Iterable list = json.decode(response.body);
        carList = list.map((model) => Car.fromJson(model)).toList();
        load = true;
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
            ImageList(Get.context!, carIndex);
            print(load);
          },
        );

        update();
      },
    ).catchError(
      (onError) {
        print(onError);
      },
    );
  }

  String number(int num) {
    if (num < 10) {
      return "0" + num.toString();
    }
    return num.toString();
  }

  void updateImageList(BuildContext context, int index) async {
    imagePrecached = false;
    imageList = [];
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ImageList(Get.context!, index);
      update();
    });
  }

  void ImageList(BuildContext context, int index) async {
    for (int i = 36; i >= 1; i--) {
      imageList.add(
        NetworkImage(
          carList[index].url360! + '$i.png',
        ),
      );
      await precacheImage(
          NetworkImage(
            carList[index].url360! + '$i.png',
          ),
          context);
    }
    imagePrecached = true;
    update();
  }
}
