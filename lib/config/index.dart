import 'package:easy_localization/easy_localization.dart' show AssetLoader;
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart' show Level;
import 'package:quiver/strings.dart' show equalsIgnoreCase;

import './assetLoader.dart' show CustomAssetLoader;
import './themes/index.dart' show CompanyData, themes;

class _Config {
  List<Locale> get locales => [
    Locale('en', 'US')
  ];

  Level _loggerLevel = Level.INFO;
  Level get loggerLevel => this._loggerLevel;

  CompanyData get companyData => themes.currentTheme;

  bool _logRedux = false;
  bool get logRedux => this._logRedux;

  AssetLoader get langAssetLoader => CustomAssetLoader();

  String _baseUrl;
  String get baseUrl => this._baseUrl;

  FlutterSecureStorage _storage;
  FlutterSecureStorage get storage => _storage;

  Future<void> initConfig() async {
    const String loggerLevelEnv = String.fromEnvironment('LOGGER_LEVEL', defaultValue: '');
    print('AD: ' + loggerLevelEnv);
    if (loggerLevelEnv.isNotEmpty) {
      this._loggerLevel = Level.LEVELS
        .firstWhere((level) => equalsIgnoreCase(loggerLevelEnv, level.name), orElse: () => this._loggerLevel);
    }

    const String themeEnv = String.fromEnvironment('THEME', defaultValue: 'default');
    themes.setTheme(themeEnv);

    this._logRedux = bool.fromEnvironment('LOG_REDUX') ?? this._logRedux;

    const baseUrlEnv = String.fromEnvironment('API_URL', defaultValue: 'https://api.oneandonly.io/api');
    this._baseUrl = baseUrlEnv;
    print('API URL: ' + this._baseUrl);

    this._storage = FlutterSecureStorage();
  }
}

final _Config config =  _Config();