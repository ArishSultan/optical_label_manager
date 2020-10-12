import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/modals/dialogs.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

class SMSInputPage extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.chat_bubble_text,
          title: 'Enter Sms Information',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextFieldAlt(
            placeholder: 'Phone #',
            controller: _phoneController,
            textInputType: TextInputType.phone,
          ),
        ),
        AppTextFieldAlt(
          maxLines: 5,
          placeholder: 'Message',
          controller: _messageController,
        )
      ],
      onGenerate: () {
        String phone = _phoneController.text;
        String message = _messageController.text;
        if (phone.isEmpty) {
          showErrorDialog(context, 'Phone no is required');
        } else {
          String data = 'SMSTO:$phone:$message';
          Output output = Output(
            type: OutputType.sms,
            name: 'Sms',
            data: data,
            timestamp: DateTime.now(),
          );
          AppData().saveOutput(output).then((value) {
            navigateTo(context, OutputPage(output: output));
          });
        }
      },
    );
  }
}
