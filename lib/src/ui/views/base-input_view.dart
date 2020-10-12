import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/ui/widgets/app-bar.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';

class BaseInputView extends StatelessWidget {
  final List<Widget> children;
  final Function() onGenerate;

  BaseInputView({this.children, this.onGenerate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Create QR'),
        floatingActionButton: FlatButton.icon(
          onPressed: onGenerate,
          shape: StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          textColor: Colors.white,
          label: Text('Generate QR Code'),
          icon: Icon(CupertinoIcons.qrcode),
          color: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
                children: children,
                crossAxisAlignment: CrossAxisAlignment.start)));
  }
}
