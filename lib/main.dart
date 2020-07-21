import 'package:easy_localization/easy_localization.dart' show EasyLocalization;
import 'package:flutter/material.dart' show runApp, Locale;
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

import './app.dart' show App;
import './config/index.dart' show config;
import './logger.dart' show initLogger;
import './config/flame.dart' show flame;
import './router.dart' show fluroRouter;
import './bgm.dart' show BGM;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await config.initConfig();
  initLogger();
  fluroRouter.configureRoutes();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await flame.init();

  runApp(
    EasyLocalization(
      supportedLocales: config.locales,
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      assetLoader: config.langAssetLoader,
      child: App()
    ),
  );
  BGM.attachWidgetBindingListener();
}