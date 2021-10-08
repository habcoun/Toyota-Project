import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:toyota/app/constants/app_images.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/home/controllers/home_controller.dart';
import 'package:toyota/app/utils/gradient.dart';

class ToyotaView extends GetView<HomeController> {
  Widget _buildCenterText() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        var scale = lerpDouble(1, 0.8, controller.animationController!.value);
        return Positioned(
          right: 0,
          left: 0,
          bottom: controller.bottomTextPosition,
          child: Transform.scale(
            scale: scale!,
            child: LinearGradientMask(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.kToyota,
                    color: Color(0xffb00022),
                    width: Get.height * 0.35,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let's Go Places",
                    style: GoogleFonts.poppins(
                      //fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCenterLogo() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        var scale = lerpDouble(1, 1.5, controller.animationController!.value);
        return Positioned(
          right: 0,
          left: 0,
          bottom: Get.height * 0.45,
          child: FractionalTranslation(
            translation: controller.toyotaImgOffset,
            child: Transform.scale(
              alignment: Alignment.bottomLeft,
              scale: scale!,
              child: LinearGradientMask(
                child: SvgPicture.asset(
                  AppImage.kCarSvg,
                  color: Color(0xffb00022),
                  width: Get.height * 0.40,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarImg() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        var scale = lerpDouble(1, 1.9, controller.animationController!.value);
        return Positioned(
          child: FractionalTranslation(
            translation: controller.toyotaLogoOffset,
            child: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: scale!,
              child: Image.asset(
                AppImage.kCar,
                height: Get.height / 4.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        var scale = lerpDouble(1, 0.8, controller.animationController!.value);
        return AnimatedBuilder(
            animation: controller.animationController!,
            builder: (context, index) {
              return Transform.scale(
                scale: scale!,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onVerticalDragUpdate: controller.onVerticalDragUpdate,
                  onVerticalDragEnd: controller.onVerticalDragEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 20),
                          blurRadius: 12,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppString.kDefaultBorder *
                            controller.animationController!.value),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade500,
                          Colors.grey.shade200,
                        ],
                      ),
                    ),
                    width: Get.width,
                    height: Get.size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildCenterLogo(),
                        _buildCarImg(),
                        _buildCenterText(),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
