import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class EAN13InputPage extends StatelessWidget {
  final _ean13Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The EAN_13',
        ),
        AppTextFieldAlt(
          controller: _ean13Controller,
          textInputType: TextInputType.number,
          maxLength: 12,
        ),
      ],
      onGenerate: (){},
    );
  }
}
