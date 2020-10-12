import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class UPCAInputPage extends StatelessWidget {
  final _uPC_A_Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The UPC_A',
        ),
        AppTextFieldAlt(
          controller: _uPC_A_Controller,
          textInputType: TextInputType.number,
          maxLength: 12,
        ),
      ],
      onGenerate: () {},
    );
  }
}
