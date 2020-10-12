import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class ITFInputPage extends StatelessWidget {
  final  _itfController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The ITF',
        ),
        AppTextFieldAlt(
          controller: _itfController,
          textInputType: TextInputType.number,
        ),
      ],
      onGenerate: () {},
    );
  }
}
