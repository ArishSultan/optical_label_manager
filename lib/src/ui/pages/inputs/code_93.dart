import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class Code93InputPage extends StatelessWidget {
  final _code93Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The CODE_93',
        ),
        AppTextFieldAlt(
          controller: _code93Controller,
          textInputType: TextInputType.number,
          maxLines: 5,
        ),
      ],
      onGenerate: () {},
    );
  }
}
