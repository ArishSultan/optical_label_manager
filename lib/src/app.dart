import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/pages/home_page.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';

class OpticalLabelManagerApp extends StatefulWidget {
  @override
  _OpticalLabelManagerAppState createState() => _OpticalLabelManagerAppState();
}

class _OpticalLabelManagerAppState extends State<OpticalLabelManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.blue
      ),
      // themeMode: ThemeMode.light,
      home: HomePage(),
    );

    return CupertinoApp(
      home: HomePage(),
    );
  }
}
