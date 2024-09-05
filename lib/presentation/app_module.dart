import 'package:get/get.dart';

import 'app_router.dart';
import 'assets/assets_bindings.dart';
import 'assets/assets_page.dart';
import 'menu/menu_bindings.dart';
import 'menu/menu_page.dart';

abstract class AppModule {
  static List<GetPage> routes = [
    GetPage(
      name: AppRouter.menu.route,
      page: () => const MenuPage(),
      binding: MenuBindings(),
    ),
    GetPage(
      name: AppRouter.asset.route,
      page: () => const AssetsPage(),
      binding: AssetsBindings(),
    ),
  ];
}
