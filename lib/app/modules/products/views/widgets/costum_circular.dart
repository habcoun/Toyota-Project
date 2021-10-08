import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

Widget costumCircular() {
  return Container(
    alignment: Alignment.center,
    width: Get.width,
    height: 50,
    child: LottieBuilder.network(
      'https://assets4.lottiefiles.com/packages/lf20_ru8ay5pn.json',
    ),
  );
}
