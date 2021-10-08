import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/map/controllers/map_controller.dart';
import 'package:toyota/app/modules/map/views/widgets/animated_map.dart';

class MapView extends GetView<MapAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
            //top: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppString.kPrimaryColors,
        title: Text(
          ' Nos Agences'.toUpperCase(),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedMapPage(),
            //  MenuView(),
          ],
        ),
      ),
    );
  }
}
