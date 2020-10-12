import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic navigateTo(BuildContext context, Widget destination, {
  Widget page, bool replace, dynamic data
}) {
  return Navigator.of(context).push(CupertinoPageRoute(
    builder: (context) => destination
  ));
}