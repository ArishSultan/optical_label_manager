import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/modals/dialogs.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

class TextInputPage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.textbox,
          title: 'Enter Text',
        ),
        AppTextFieldAlt(
          maxLines: 10,
          placeholder: 'Hello everyone etc...',
          controller: _textController,
        ),
      ],
      onGenerate: () {
        String text = _textController.text;
        if (text?.isNotEmpty ?? false) {
          Output output = Output(
            type: OutputType.text,
            name: 'Text',
            data: text,
            timestamp: DateTime.now(),
          );
          AppData().saveOutput(output).then((value) {
            navigateTo(context, OutputPage(output: output));
          });
        } else
          showErrorDialog(context, 'Text must not be empty');
      },
    );
  }
}
