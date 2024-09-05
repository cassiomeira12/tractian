import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/presentation/app_bindings.dart';
import 'package:tractian/presentation/menu/menu_bindings.dart';
import 'package:tractian/presentation/menu/menu_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUpAll(() {
    AppBindings().dependencies();

    MenuBindings().dependencies();
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('test loading companies successfully', () async {
    var controller = Get.find<MenuController>();
    while (controller.isLoading.value) {
      await Future.delayed(const Duration(seconds: 1));
    }
    expect(controller.companies, isNotEmpty);
  });
}
