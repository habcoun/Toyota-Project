import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toyota/app/modules/home/views/widgets/toyota_view.dart';
import 'package:toyota/app/modules/menu/views/menu_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xFF3b5998),
                    ),
                    child: LineIcon(
                      LineIcons.facebookF,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: (Get.height * 0.5) / 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xFFA11111),
                    ),
                    child: LineIcon(
                      LineIcons.youtube,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: (Get.height * 0.5) / 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xFF8F175D),
                    ),
                    child: LineIcon(
                      LineIcons.instagram,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 100,
                right: 0,
                bottom: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© Copyright 2021'.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Powered By Habchi Bessem'.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
            MenuView(),
            ToyotaView(),
          ],
        ),
      ),
    );
  }
}
