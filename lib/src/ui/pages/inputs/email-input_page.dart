import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/modals/dialogs.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

class EmailInputPage extends StatelessWidget {
  final _receiverAddressController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.at_circle,
          title: 'Enter Email Information',
        ),
        SizedBox(height: 20),
        AppTextFieldAlt(
          textInputType: TextInputType.emailAddress,
          controller: _receiverAddressController,
          placeholder: 'Receiver\'s Address',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextFieldAlt(
            placeholder: "Email\'s Subject",
            controller: _subjectController,
          ),
        ),
        AppTextFieldAlt(
          maxLines: 5,
          placeholder: "Email\'s Body",
          controller: _bodyController,
        )
      ],
      onGenerate: () {
        String address = _receiverAddressController.text;
        String subject = _subjectController.text;
        String body = _bodyController.text;
        if (address.isEmpty) {
          showErrorDialog(context, 'Receiver\'s Address is required');
        } else {
          String data='mailto:$address?subject=$subject&body=$body';
          Output output = Output(
            type: OutputType.email,
            name: 'Email',
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
