import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/person-contact_model.dart';
import 'package:optical_label_manager/src/ui/widgets/app-bar.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vcard/vcard.dart';

// ignore: must_be_immutable
class CreateMyQrPage extends StatelessWidget {
  VCard _vCard;
  final _key = GlobalKey<FormState>();

  CreateMyQrPage() {
    final _appData = AppData();

    if (_appData.isContactSaved()) {
      _vCard = _appData.readContact().toVCard();
    } else {
      _vCard = VCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My QR-Code',
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.checkmark_alt),
            onPressed: () async {
              if (_key.currentState.validate()) {
                _key.currentState.save();
                await AppData().saveContact(PersonContact.fromVCard(_vCard));
              }

              // navigateTo(context, OutputPage(
              //   name: ,
              //   type: ,
              //   data:
              // ));
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
        child: Form(
          key: _key,
          child: Column(children: [
            Row(children: [
              Expanded(child: AppTextField(
                label: 'First Name',
                value: _vCard.firstName,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'It is required';
                  }

                  return null;
                },
                onSaved: (val) => _vCard.firstName = val,
              )),
              SizedBox(width: 15),
              Expanded(child: AppTextField(
                label: 'Last Name',
                value: _vCard.lastName,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'It is required';
                  }

                  return null;
                },
                onSaved: (val) => _vCard.lastName = val,
              ))
            ], crossAxisAlignment: CrossAxisAlignment.start),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: AppTextField(
                label: 'Organization',
                value: _vCard.organization,
                onSaved: (val) => _vCard.organization = val,
              ),
            ),
            AppTextField(
              label: 'Address',
              value: _vCard.homeAddress.label,
              onSaved: (val) => _vCard.homeAddress = MailingAddress('Home')
                ..label = val,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: AppTextField(
                label: 'Phone',
                value: _vCard.cellPhone,
                onSaved: (val) => _vCard.cellPhone = val,
              ),
            ),
            AppTextField(
              label: 'Email',
              value: _vCard.email,
              onSaved: (val) => _vCard.email = val,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: AppTextField(
                label: 'Note',
                maxLines: 5,
                value: _vCard.note,
                onSaved: (val) => _vCard.note = val,
              ),
            )
          ]),
        )
      ),
    );
  }
}
