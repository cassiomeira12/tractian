import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tractian/presentation/app.dart';
import 'package:tractian/presentation/app_router.dart';
import 'package:tractian/presentation/menu/menu_controller.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late App app;

  setUpAll(() {
    app = const App();
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  testWidgets('test loading menu page', (tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('companies_key')), findsOneWidget);

    var listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    var menuController = Get.find<MenuController>();

    for (var entry in menuController.companies.asMap().entries) {
      expect(find.text(entry.value.name), findsOneWidget);
      expect(find.byKey(Key('company_key_${entry.key}')), findsOneWidget);
    }
  });

  testWidgets('test select company on page', (tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('companies_key')), findsOneWidget);

    var listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    var firstCompany = find.byKey(const Key('company_key_0'));
    expect(firstCompany, findsOneWidget);

    await tester.tap(firstCompany);
    await tester.pumpAndSettle();

    expect(Get.currentRoute, AppRouter.asset.route);
  });
}
