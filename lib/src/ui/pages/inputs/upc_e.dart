import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class UPCEInputPage extends StatelessWidget {
  final _uPC_E_Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The UPC_E',
        ),
        AppTextFieldAlt(
          controller: _uPC_E_Controller,
          textInputType: TextInputType.number,
          maxLength: 8,
        ),
      ],
      onGenerate: (){},
    );
  }
}
