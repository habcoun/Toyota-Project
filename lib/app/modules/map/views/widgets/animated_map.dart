import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/map/controllers/map_controller.dart';
import 'package:toyota/app/modules/map/models/map_marker.dart';
import 'package:toyota/app/modules/map/views/widgets/map_item_details.dart';

class AnimatedMapPage extends GetView<MapAnimationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapAnimationController>(
      init: MapAnimationController(),
      initState: (_) {},
      builder: (_) {
        return Stack(
          children: [
            // if (controller.currentPosition != null)
            //   Text(
            //     "LAT: ${controller.currentPosition!.latitude}, LNG: ${controller.currentPosition!.longitude}",
            //   ),
            FlutterMap(
              options: MapOptions(
                minZoom: 5,
                maxZoom: 16,
                zoom: 11,
                center: AppString.myLocation,
              ),
              nonRotatedLayers: [
                TileLayerOptions(
                  urlTemplate: AppString.URL_TEMPLATE,
                  additionalOptions: {
                    'accessToken': AppString.MAPBOX_TOKEN,
                    'id': AppString.MAPBOX_STYLE,
                  },
                ),
                MarkerLayerOptions(
                  markers: controller.markerList,
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      height: 50,
                      width: 50,
                      point: AppString.myLocation,
                      builder: (_) {
                        return MyLocationMarker(controller.animationController);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              height: Get.height * 0.3,
              child: PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mapMarkers.length,
                itemBuilder: (context, index) {
                  final item = mapMarkers[index];
                  return MapItemDetail(
                    mapMarker: item,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class MyLocationMarker extends AnimatedWidget {
  const MyLocationMarker(Animation<double> animation, {Key? key})
      : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final size = 40;
    final newValue = lerpDouble(0.5, 1.0, value)!;
    return Center(
        child: Stack(
      children: [
        Center(
          child: Container(
            height: size * newValue,
            width: size * newValue,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppString.kPrimaryColors.withOpacity(0.3),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: AppString.kPrimaryColors,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ));
  }
}
