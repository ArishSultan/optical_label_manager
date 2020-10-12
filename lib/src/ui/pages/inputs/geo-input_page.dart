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

class GeoInputPage extends StatelessWidget {
  final _latitudeController = new TextEditingController();
  final _longitudeController = new TextEditingController();
  final _queryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.location,
          title: 'Enter Geo Information',
        ),
        SizedBox(height: 20),
        AppTextFieldAlt(
          textInputType: TextInputType.number,
          controller: _latitudeController,
          placeholder: 'Latitude',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextFieldAlt(
            textInputType: TextInputType.number,
            placeholder: 'Longitude',
            controller: _longitudeController,
          ),
        ),
        AppTextFieldAlt(
          maxLines: 5,
          placeholder: "Query",
          controller: _queryController,
        )
      ],
      onGenerate: () {
        String latitude = _latitudeController.text;
        String longitude = _longitudeController.text;
        String query = _queryController.text;
        if (latitude.isEmpty) {
          showErrorDialog(context, 'Latitude is required');
          return;
        }
        if (longitude.isEmpty) {
          showErrorDialog(context, 'Longitude is required');
          return;
        }
        String data = 'geo:$latitude,$longitude?q=$query';
        Output output = Output(
          type: OutputType.geo,
          name: 'Geo',
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
