import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/modals/dialogs.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

class PhoneInputPage extends StatelessWidget {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.phone,
          title: 'Enter Contact Number',
        ),
        AppTextFieldAlt(
          placeholder: '+92300630**** etc...',
          textInputType: TextInputType.phone,
          controller: _phoneController,
        ),
      ],
      onGenerate: () {
        String phone = _phoneController.text;
        if (phone.isEmpty) {
          showErrorDialog(context, 'Phone is required');
          return;
        }
        String data = 'tel:$phone';
        Output output = Output(
          type: OutputType.phone,
          name: 'Phone',
          data: data,
          timestamp: DateTime.now(),
        );
        AppData().saveOutput(output).then((value) {
          navigateTo(context, OutputPage(output: output));
        });
      },
    );
  }
}
