import 'package:flutter/material.dart' show
  AssetImage,
  ThemeData;

import './default.dart' show Default;

class _Themes {

  CompanyData currentTheme = Default();

  Map<String, CompanyData> themes = {
    'default': Default(),
  };

  void setTheme(String theme) {
    currentTheme = themes[theme];
  }

}

abstract class CompanyData {
  String get name;
  ThemeData get theme;
  AssetImage get image1;
}

final _Themes themes = _Themes();