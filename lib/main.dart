import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/app.dart';
import 'package:optical_label_manager/src/data.dart';

void main() async {
  await AppData.initiate();
  runApp(OpticalLabelManagerApp());
}

