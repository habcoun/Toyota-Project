import 'package:get/get.dart';
import 'package:toyota/app/modules/auth/bindings/auth_binding.dart';
import 'package:toyota/app/modules/auth/views/auth_view.dart';
import 'package:toyota/app/modules/auth/views/register_view.dart';
import 'package:toyota/app/modules/contact/bindings/contact_binding.dart';
import 'package:toyota/app/modules/contact/views/contact_view.dart';
import 'package:toyota/app/modules/home/bindings/home_binding.dart';
import 'package:toyota/app/modules/home/views/home_view.dart';
import 'package:toyota/app/modules/map/bindings/map_binding.dart';
import 'package:toyota/app/modules/map/views/map_view.dart';
import 'package:toyota/app/modules/menu/bindings/menu_binding.dart';
import 'package:toyota/app/modules/menu/views/menu_view.dart';
import 'package:toyota/app/modules/products/bindings/products_binding.dart';
import 'package:toyota/app/modules/products/views/products_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
  ];
}
