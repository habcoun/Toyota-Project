import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyota/app/modules/products/controllers/products_controller.dart';
import 'package:get/get.dart';

class ListBuilder extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      init: ProductsController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                left: 110,
                top: 180,
                child: Container(
                  width: Get.width * .65,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dolor metus, commodo et accumsan ac, porta quis erat. Fusce eu felis erat. Fusce suscipit tempor eros,',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 110,
                top: 120,
                child: Container(
                  width: Get.width * .65,
                  child: Text(
                    controller.carList[controller.carIndex].subname
                        .toString()
                        .toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 20,
                child: Container(
                  width: Get.width * .6,
                  child: Text(
                    controller.carList[controller.carIndex].name
                        .toString()
                        .toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: Color(0xffb00022),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 50,
                child: Text(
                  '2020'.toUpperCase(),
                  style: GoogleFonts.poppins(
                      color: Color(0xffb00022),
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
              ),
              //  Text(controller.carStringUrl[0]),
            ],
          ),
        );
      },
    );
  }
}
