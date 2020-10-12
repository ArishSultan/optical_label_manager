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
import 'package:vcard/vcard.dart';

class MyQRInputPage extends StatelessWidget {
  final _nameController = new TextEditingController();
  final _organizationController = new TextEditingController();
  final _phoneController = new TextEditingController();
  final _noteController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.qrcode,
          title: 'Enter QR Information',
        ),
        SizedBox(height: 20),
        AppTextFieldAlt(
          controller: _nameController,
          placeholder: 'Name',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: AppTextFieldAlt(
            controller: _organizationController,
            placeholder: 'Organization',
          ),
        ),
        AppTextFieldAlt(
          controller: _addressController,
          placeholder: 'Address',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: AppTextFieldAlt(
            controller: _phoneController,
            placeholder: 'Phone',
            textInputType: TextInputType.phone,
          ),
        ),
        AppTextFieldAlt(
          controller: _emailController,
          placeholder: 'Email',
          textInputType: TextInputType.emailAddress,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: AppTextFieldAlt(
            controller: _noteController,
            placeholder: 'Note',
            maxLines: 5,
          ),
        ),
      ],
      onGenerate: () {
        String name = _nameController.text;
        String organization = _organizationController.text;
        String address = _addressController.text;
        String phone = _phoneController.text;
        String email = _emailController.text;
        String note = _noteController.text;
        if (name.isEmpty) {
          showErrorDialog(context, 'Name field is required');
        } else {
          VCard vCard = VCard();
          vCard.firstName = name;
          vCard.organization = organization;
          vCard.cellPhone = phone;
          vCard.jobTitle = address;
          vCard.email = email;
          vCard.note = note;
          Output output = Output(
            type: OutputType.contact,
            name: 'Contact',
            data: vCard.getFormattedString(),
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
