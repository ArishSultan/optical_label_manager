import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class DataMatrixInputPage extends StatelessWidget {
  final  _dataMatrixController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.barcode,
          title: 'Enter The DATA_MATRIX',
        ),
        AppTextFieldAlt(
          controller: _dataMatrixController,
          textInputType: TextInputType.number,
          maxLines: 5,
        ),
      ],
      onGenerate: () {},
    );
  }
}
