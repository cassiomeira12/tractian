import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/presentation/app.dart';
import 'package:tractian/presentation/app_bindings.dart';
import 'package:tractian/presentation/app_router.dart';
import 'package:tractian/presentation/assets/assets_bindings.dart';
import 'package:tractian/presentation/assets/assets_controller.dart';
import 'package:tractian/presentation/menu/menu_bindings.dart';
import 'package:tractian/presentation/stores/company_store.dart';

import '../../infra/data_sources/asset_data_source_mock.dart';
import '../../infra/data_sources/company_data_source_mock.dart';
import '../../infra/data_sources/location_data_source_mock.dart';

void main() {
  late StatefulWidget app;

  setUpAll(() {
    SharedPreferences.setMockInitialValues({});

    app = App(initialRoute: AppRouter.asset.route);
  });

  setUp(() {
    AppBindings().dependencies();

    Get.put<ICompanyDataSource>(
      CompanyDataSourceMock(),
      permanent: true,
    );

    Get.put<ILocationDataSource>(
      LocationDataSourceMock(),
      permanent: true,
    );

    Get.put<IAssetDataSource>(
      AssetDataSourceMock(),
      permanent: true,
    );

    MenuBindings().dependencies();
    AssetsBindings().dependencies();
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  testWidgets('test loading assets page', (tester) async {
    var getCompaniesUseCase = Get.find<IGetCompaniesUseCase>();
    var companies = await getCompaniesUseCase.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var companyStore = Get.find<CompanyStore>();
    companyStore.companySelected = companies[0];

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    var searchField = find.text('search'.tr);
    var energyButton = find.text('energy_sensor'.tr);
    var alertButton = find.text('alert_type'.tr);

    expect(find.text('menu_asset'.tr), findsOneWidget);
    expect(searchField, findsOneWidget);
    expect(energyButton, findsOneWidget);
    expect(alertButton, findsOneWidget);

    var controller = Get.find<AssetsController>();
    while (controller.isLoading.value) {
      await Future.delayed(const Duration(seconds: 1));
    }

    expect(controller.list, isNotEmpty);
    expect(find.byKey(const Key('assets_key')), findsOneWidget);
  });

  testWidgets('test filter only energy sensors ', (tester) async {
    var getCompaniesUseCase = Get.find<IGetCompaniesUseCase>();
    var companies = await getCompaniesUseCase.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var companyStore = Get.find<CompanyStore>();
    companyStore.companySelected = companies[0];

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    var energyButton = find.text('energy_sensor'.tr);
    expect(energyButton, findsOneWidget);

    await tester.tap(energyButton);
    await tester.pumpAndSettle();

    expect(find.text('Fan - External'), findsOneWidget);

    await tester.tap(energyButton);
    await tester.pumpAndSettle();
  });

  testWidgets('test filter only alert status', (tester) async {
    var getCompaniesUseCase = Get.find<IGetCompaniesUseCase>();
    var companies = await getCompaniesUseCase.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var companyStore = Get.find<CompanyStore>();
    companyStore.companySelected = companies[0];

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    var alertButton = find.text('alert_type'.tr);

    expect(find.text('menu_asset'.tr), findsOneWidget);
    expect(alertButton, findsOneWidget);

    await tester.tap(alertButton);
    await tester.pumpAndSettle();

    expect(find.text('Machinery house'), findsOneWidget);
    expect(find.text('Motors H12D'), findsOneWidget);
    expect(find.text('Motor H12D- Stage 1'), findsOneWidget);
    expect(find.text('Motor H12D-Stage 2'), findsOneWidget);
    expect(find.text('Motor H12D-Stage 3'), findsOneWidget);

    await tester.tap(alertButton);
    await tester.pumpAndSettle();
  });

  testWidgets('test error loading assets page', (tester) async {
    Get.replace<ILocationDataSource>(
      LocationDataSourceMock(
        throwError: true,
      ),
    );

    Get.replace<IAssetDataSource>(
      AssetDataSourceMock(
        throwError: true,
      ),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('companies_key')), findsNothing);

    expect(find.text('error_loading_assets'.tr), findsOneWidget);
    expect(find.text('try_again'.tr), findsOneWidget);
  });
}
