import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import '../../config/index.dart';
import '../../router.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: config.companyData.image1, fit: BoxFit.cover),
      ),
      child: Center(
        child: FlatButton(
          child: Text('Play Langaw', style: theme.textTheme.headline1),
          onPressed: () {
            router.push('/game');
          },
        ),
      ),
    );
  }
}