import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show
  BuildContext,
  MaterialApp,
  StatelessWidget,
  Widget;

import './config/index.dart' show config;
import './router.dart' show fluroRouter, router;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: config.locales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorKey: router.navigatorKey,
      onGenerateRoute: fluroRouter.generator,
      theme: config.companyData.theme,
      title: 'Game',
    );
  }
}
