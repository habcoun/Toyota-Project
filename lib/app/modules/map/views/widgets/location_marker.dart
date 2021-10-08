import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:toyota/app/constants/app_images.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/map/controllers/map_controller.dart';

class LocationMarker extends GetView<MapAnimationController> {
  const LocationMarker({
    Key? key,
    this.selected = false,
  }) : super(key: key);
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final size =
        selected ? AppString.kMarkSizeExpanded : AppString.kMarkSizeSmall;
    return Center(
      child: AnimatedContainer(
        width: size,
        height: size,
        duration: const Duration(milliseconds: 400),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppString.kPrimaryColors,
            image: DecorationImage(
              image: AssetImage(
                AppImage.kToyotaPng,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
