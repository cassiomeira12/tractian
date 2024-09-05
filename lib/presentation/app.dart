import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../translations/translation.dart';
import 'app_bindings.dart';
import 'app_module.dart';
import 'app_router.dart';

class App extends StatefulWidget {
  final String? initialRoute;

  const App({super.key, this.initialRoute});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tractian',
      // theme: LightTheme.theme(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: widget.initialRoute ?? AppRouter.menu.route,
      getPages: AppModule.routes,
      initialBinding: AppBindings(),
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 300),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
