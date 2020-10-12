import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/modals/dialogs.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

// ignore: must_be_immutable
class URLInputPage extends StatelessWidget {
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.globe,
          title: 'Enter The URL',
        ),
        AppTextFieldAlt(
          controller: _urlController,
          placeholder: 'http://google.com etc...',
          textInputType: TextInputType.url,
        ),
      ],
      onGenerate: () {
        String url = _urlController.text;
        if (url?.isNotEmpty ?? false) {
          Output output = Output(
            type: OutputType.url,
            name: 'Url',
            data: url,
            timestamp: DateTime.now(),
          );
          AppData().saveOutput(output).then((value) {
            navigateTo(context, OutputPage(output: output));
          });
        } else {
          showErrorDialog(context, 'URL must not be empty');
        }
      },
    );
  }
}
