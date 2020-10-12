import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class EAN8InputPage extends StatelessWidget {
  final _ean8Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The EAN_8',
        ),
        AppTextFieldAlt(
          controller: _ean8Controller,
          textInputType: TextInputType.number,
          maxLength: 7,
        ),
      ],
      onGenerate: () {},
    );
  }
}
