import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/views/base-input_view.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field-title.dart';
import 'package:optical_label_manager/src/ui/widgets/app-text-field.dart';

class CalenderInputPage extends StatelessWidget {
  final _eventNameController = new TextEditingController();
  final _locationController = new TextEditingController();
  final _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.calendar,
          title: 'Enter Event Information',
        ),
        SizedBox(height: 20),
        AppTextFieldAlt(
          controller: _eventNameController,
          placeholder: 'Event Name',
        ),
        ListTile(
          title: Text('Start:'),
          subtitle: Text('2020-10-09'),
        ),
        ListTile(
          title: Text('End:'),
          subtitle: Text('2020-10-09'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextFieldAlt(
            placeholder: "Location",
            controller: _locationController,
          ),
        ),
        AppTextFieldAlt(
          maxLines: 5,
          placeholder: "Description",
          controller: _descriptionController,
        )
      ],
      onGenerate: () {},
    );
  }
}
