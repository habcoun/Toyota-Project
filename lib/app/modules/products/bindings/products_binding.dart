import 'package:get/get.dart';
import 'package:toyota/app/modules/products/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(
      ProductsController(),
    );
  }
}
