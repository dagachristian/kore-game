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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 20.0),
            FlatButton(
              child: Text('Dank Game', style: theme.textTheme.headline1),
              onPressed: () {
                router.push('/game/dank');
              },
            ),
          ],
        ),
      ),
    );
  }
}