import 'package:flutter/material.dart' show
  AssetImage,
  Brightness,
  Colors,
  FontStyle,
  FontWeight,
  TextStyle,
  TextTheme,
  ThemeData,
  VisualDensity;

import './index.dart' show CompanyData;

class Default implements CompanyData {
  @override
  String get name => 'One and Only';

  @override
  ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[800],
    accentColor: Colors.cyan[400],
    backgroundColor: Colors.grey[900].withOpacity(0.7),
    // Define the default font family.
    fontFamily: 'Roboto',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  AssetImage get image1 => AssetImage('assets/images/default.jpg');
}