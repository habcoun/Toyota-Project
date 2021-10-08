import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:toyota/app/modules/map/models/map_marker.dart';
import 'package:toyota/app/modules/map/views/widgets/location_marker.dart';

class MapAnimationController extends GetxController
    with SingleGetTickerProviderMixin {
  late final AnimationController animationController;
  List<Marker> markerList = <Marker>[];
  int selectedIndex = 0;
  // Position? currentPosition;
  PageController pageController = PageController(
    keepPage: true,
  );

  @override
  void onInit() {
    //  getCurrentLocation();
    markerList = buildMarkers()!;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
    animationController.repeat(reverse: true);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    pageController.dispose();
  }

  List<Marker>? buildMarkers() {
    print(mapMarkers.length);
    for (var i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      markerList.add(
        Marker(
          width: 100,
          height: 100,
          point: mapItem.location!,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                selectedIndex = i;
                print(pageController.keepScrollOffset);
                pageController.animateToPage(
                  i,
                  curve: Curves.easeInCirc,
                  duration: const Duration(milliseconds: 400),
                );
                update();
              },
              child: LocationMarker(
                selected: selectedIndex == i,
              ),
            );
          },
        ),
      );
    }
    update();
    return markerList;
  }

  // getCurrentLocation() {
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     currentPosition = position;
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}
