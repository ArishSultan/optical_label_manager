import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class Code39InputPage extends StatelessWidget {
  final _code39Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The CODE_39',
        ),
        AppTextFieldAlt(
          controller: _code39Controller,
          textInputType: TextInputType.number,
          maxLength: 5,
        ),
      ],
      onGenerate: () {},
    );
  }
}
