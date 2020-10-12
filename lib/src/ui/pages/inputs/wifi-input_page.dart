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

class WifiInputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WifiInputPageState();
}

class _WifiInputPageState extends State<WifiInputPage> {
  final _ssdController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final List<String> _networkType = ['WPA/WPA2', 'WEP', 'No Passsword'];
  String _selectedType;
  bool _hidden;

  @override
  void initState() {
    super.initState();
    _selectedType = _networkType.elementAt(0);
    _hidden = false;
  }

  @override
  Widget build(BuildContext context) {
    return BaseInputView(
      children: [
        AppTextFieldTitle(
          icon: CupertinoIcons.wifi,
          title: 'Enter Wifi Information',
        ),
        SizedBox(height: 20),
        AppTextFieldAlt(
          textInputType: TextInputType.emailAddress,
          controller: _ssdController,
          placeholder: 'SSD/Network Name',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextFieldAlt(
            placeholder: 'Password',
            controller: _passwordController,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(right: 10.0, left: 15.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _selectedType,
              items: [
                DropdownMenuItem(
                  child: Text(_networkType.elementAt(0)),
                  value: _networkType.elementAt(0),
                ),
                DropdownMenuItem(
                  child: Text(_networkType.elementAt(1)),
                  value: _networkType.elementAt(1),
                ),
                DropdownMenuItem(
                  child: Text(_networkType.elementAt(2)),
                  value: _networkType.elementAt(2),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: _hidden,
              onChanged: (value) {
                setState(() {
                  _hidden = value;
                });
              },
            ),
            Text(
              'Hidden',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
      onGenerate: () {
        String ssd = _ssdController.text;
        String password = _passwordController.text;
        if (ssd.isEmpty) {
          showErrorDialog(context, 'Network name is required');
          return;
        }
        if (_selectedType != _networkType.elementAt(2)) {
          if (password.isEmpty) {
            showErrorDialog(context, 'Password field is required');
            return;
          }
        }
        String data = 'WIFI:S:$ssd;T:$_selectedType;P:$password;H:$_hidden';
        Output output = Output(
          type: OutputType.wifi,
          name: 'Wifi',
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
