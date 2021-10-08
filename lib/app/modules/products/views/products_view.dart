import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toyota/app/modules/menu/views/menu_view.dart';
import 'package:toyota/app/modules/products/controllers/products_controller.dart';
import 'package:toyota/app/modules/products/views/widgets/costum_circular.dart';
import 'package:toyota/app/utils/image_view_360.dart';
import 'package:toyota/app/utils/infinity_page_view.dart';
import 'widgets/list_builder.dart';
import 'widgets/load_text.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    InfinityPageController? infinityPageController = InfinityPageController(
      viewportFraction: 0.75,
      initialPage: 0,
    );
    return GetBuilder<ProductsController>(
      init: ProductsController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                (controller.imagePrecached)
                    ? ListBuilder()
                    : Center(
                        child: Text(''),
                      ),
                Positioned(
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    child: MenuView(),
                  ),
                ),
                (controller.load)
                    // (1 == 2)
                    ? Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 300,
                          width: Get.width,
                          child: InfinityPageView(
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              print(index);
                              controller.updateImageList(context, index);
                              controller.carIndex = index;
                            },
                            controller: infinityPageController,
                            itemCount: controller.carList.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  (controller.imagePrecached)
                                      ? Transform.scale(
                                          alignment: Alignment.center,
                                          scale: 1.3,
                                          child: Container(
                                            child: ImageView360(
                                              key: UniqueKey(),
                                              autoRotate: true,
                                              imageList: controller.imageList,
                                              swipeSensitivity: 4,
                                             
                                              frameChangeDuration:
                                                  Duration(milliseconds: 50),
                                              allowSwipeToRotate: true,
                                              onImageIndexChanged:
                                                  (currentImageIndex) {
                                                // print("currentImageIndex: $currentImageIndex");
                                              },
                                            ),
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            SizedBox(
                                              child: LoadText(),
                                            ),
                                          ],
                                        ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    : Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 150,
                          child: costumCircular(),
                        ),
                      ),
                Positioned(
                  right: 20,
                  left: 20,
                  bottom: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFB00000),
                          Color(0xffb00022),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.3, 1.0],
                      ),
                    ),
                    height: 60,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            infinityPageController.jumpToPage(
                              infinityPageController.page - 1,
                            );
                          },
                          child: Icon(
                            LineIcons.arrowCircleLeft,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            infinityPageController
                                .jumpToPage(infinityPageController.page + 1);
                          },
                          child: Icon(
                            LineIcons.arrowCircleRight,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
