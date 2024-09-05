// import 'package:flutter/material.dart' hide MenuController;
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:tractian/presentation/app.dart';
// import 'package:tractian/presentation/app_router.dart';

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   late App app;

//   setUpAll(() {
//     app = const App();
//   });

//   tearDown(() {
//     Get.deleteAll(force: true);
//   });

//   testWidgets('test loading assets page', (tester) async {
//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     expect(find.byKey(const Key('companies_key')), findsOneWidget);

//     var listView = find.byType(ListView);
//     expect(listView, findsOneWidget);

//     var firstCompany = find.byKey(const Key('company_key_0'));
//     expect(firstCompany, findsOneWidget);

//     await tester.tap(firstCompany);
//     await tester.pumpAndSettle();

//     expect(Get.currentRoute, AppRouter.asset.route);

//     var searchField = find.text('search'.tr);
//     var energyButton = find.text('energy_sensor'.tr);
//     var alertButton = find.text('alert_type'.tr);

//     expect(find.text('menu_asset'.tr), findsOneWidget);
//     expect(searchField, findsOneWidget);
//     expect(energyButton, findsOneWidget);
//     expect(alertButton, findsOneWidget);

//     expect(find.byKey(const Key('assets_key')), findsOneWidget);
//   });

//   testWidgets('test search asset', (tester) async {
//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     expect(find.byKey(const Key('companies_key')), findsOneWidget);

//     var listView = find.byType(ListView);
//     expect(listView, findsOneWidget);

//     var firstCompany = find.byKey(const Key('company_key_0'));
//     expect(firstCompany, findsOneWidget);

//     await tester.tap(firstCompany);
//     await tester.pumpAndSettle();

//     expect(Get.currentRoute, AppRouter.asset.route);

//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     var searchField = find.byKey(const Key('search_assets_field'));
//     expect(searchField, findsOneWidget);

//     await tester.tap(searchField);
//     await tester.pumpAndSettle();

//     await tester.enterText(searchField, 'belt');
//     await tester.pumpAndSettle();

//     await tester.pumpAndSettle(const Duration(seconds: 2));
//     await tester.pumpAndSettle();

//     expect(find.text('PRODUCTION AREA - RAW MATERIAL'), findsOneWidget);
//     expect(find.text('CHARCOAL STORAGE SECTOR'), findsOneWidget);
//     expect(find.text('CONVEYOR BELT ASSEMBLY'), findsOneWidget);
//     expect(find.text('MOTOR TC01 COAL UNLOADING AF02'), findsOneWidget);
//     expect(find.text('MOTOR RT COAL AF01'), findsOneWidget);

//     await tester.tap(searchField);
//     await tester.pumpAndSettle();

//     await tester.enterText(searchField, '');
//     await tester.pumpAndSettle();
//   });

//   testWidgets('test filter only energy sensors ', (tester) async {
//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     expect(find.byKey(const Key('companies_key')), findsOneWidget);

//     var listView = find.byType(ListView);
//     expect(listView, findsOneWidget);

//     var firstCompany = find.byKey(const Key('company_key_0'));
//     expect(firstCompany, findsOneWidget);

//     await tester.tap(firstCompany);
//     await tester.pumpAndSettle();

//     expect(Get.currentRoute, AppRouter.asset.route);

//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     var energyButton = find.text('energy_sensor'.tr);
//     expect(energyButton, findsOneWidget);

//     await tester.tap(energyButton);
//     await tester.pumpAndSettle();

//     expect(find.text('Fan - External'), findsOneWidget);

//     await tester.tap(energyButton);
//     await tester.pumpAndSettle();
//   });

//   testWidgets('test filter only alert status', (tester) async {
//     await tester.pumpWidget(app);
//     await tester.pumpAndSettle();

//     expect(find.byKey(const Key('companies_key')), findsOneWidget);

//     var listView = find.byType(ListView);
//     expect(listView, findsOneWidget);

//     var firstCompany = find.byKey(const Key('company_key_0'));
//     expect(firstCompany, findsOneWidget);

//     await tester.tap(firstCompany);
//     await tester.pumpAndSettle();

//     expect(Get.currentRoute, AppRouter.asset.route);

//     var alertButton = find.text('alert_type'.tr);

//     expect(find.text('menu_asset'.tr), findsOneWidget);
//     expect(alertButton, findsOneWidget);

//     await tester.tap(alertButton);
//     await tester.pumpAndSettle();

//     expect(find.text('Machinery house'), findsOneWidget);
//     expect(find.text('Motors H12D'), findsOneWidget);
//     expect(find.text('Motor H12D- Stage 1'), findsOneWidget);
//     expect(find.text('Motor H12D-Stage 2'), findsOneWidget);
//     expect(find.text('Motor H12D-Stage 3'), findsOneWidget);

//     await tester.tap(alertButton);
//     await tester.pumpAndSettle();
//   });
// }
