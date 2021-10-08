import 'dart:math';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  AnimationController? slideAnimationController;
  Animation<double>? slideInAnimation;
  Offset toyotaLogoOffset = Offset(0, 0);
  Offset toyotaImgOffset = const Offset(0, 0);
  double bottomTextPosition = 200;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
    );

    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )
      ..addListener(() {
        toyotaLogoOffset = Offset(-1 + slideInAnimation!.value, 0);
        toyotaImgOffset = Offset(1 - slideInAnimation!.value, 0);
        bottomTextPosition = 70 + (50 * slideInAnimation!.value);
        update();
      })
      ..forward();

    slideInAnimation = CurvedAnimation(
      parent: slideAnimationController!,
      curve: Curves.easeIn,
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    slideAnimationController!.dispose();
    animationController!.dispose();
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    animationController!.value =
        animationController!.value - details.primaryDelta! * 3 / Get.height;
    update();
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (animationController!.isAnimating ||
        animationController!.status == AnimationStatus.completed) {}
    final double flingVelocity = details.velocity.pixelsPerSecond.dy / 100;

    if (flingVelocity < 0.0) {
      animationController!.fling(
        velocity: max(2.0, -flingVelocity),
      );
    } else if (flingVelocity > 0.0) {
      animationController!.fling(
        velocity: min(-2.0, -flingVelocity),
      );
    } else {
      animationController!
          .fling(velocity: animationController!.value < 0.5 ? -2.0 : 2.0);
    }
    update();
  }
}
