import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/aztec-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/calender-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/codabar.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/code_128.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/code_39.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/code_93.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/contact-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/data_matrix.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/ean_13.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/ean_8.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/email-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/geo-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/itf.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/myQR-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/pdf_471.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/phone-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/sms-input_page.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/upc-a.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/upc_e.dart';
import 'package:optical_label_manager/src/ui/pages/inputs/wifi-input_page.dart';
import 'package:optical_label_manager/src/ui/widgets/app-bar.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';

import 'inputs/url-input_page.dart';
import 'inputs/text-input_page.dart';

class CreateOpticalLabelPage extends StatelessWidget {
  static const _divider = const Divider(
    color: Colors.grey, height: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create Optical Label',
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 15
        ),
        child: Column(children: [
          Card(
            child: Wrap(children: [
              _ListTile(
                title: 'Uniform Resource Locator (URL)',
                icon: CupertinoIcons.globe,
                onTap: () => navigateTo(context, URLInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Text',
                icon: CupertinoIcons.textbox,
                onTap: () => navigateTo(context, TextInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Contact',
                icon: CupertinoIcons.person,
                onTap: () => navigateTo(context, ContactInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Email',
                icon: CupertinoIcons.at_circle,
                onTap: () => navigateTo(context, EmailInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'SMS',
                icon: CupertinoIcons.chat_bubble_text,
                onTap: () => navigateTo(context, SMSInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Geo',
                icon: CupertinoIcons.location,
                onTap: () => navigateTo(context, GeoInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Phone',
                icon: CupertinoIcons.phone,
                onTap: () => navigateTo(context, PhoneInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Calendar',
                icon: CupertinoIcons.calendar,
                onTap: () => navigateTo(context, CalenderInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'Wifi',
                icon: CupertinoIcons.wifi,
                onTap: () => navigateTo(context, WifiInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'My QR',
                icon: CupertinoIcons.qrcode,
                onTap: () => navigateTo(context, MyQRInputPage()),
              ),
            ]),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 0, 5),
            child: Text('Other Types', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            )),
          ),

          Card(
            child: Wrap(children: [
              _ListTile(
                title: 'EAN_8',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, EAN8InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'EAN_13',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, EAN13InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'UPC_E',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, UPCEInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'UPC_A',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, UPCAInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'CODE_39',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, Code39InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'CODE_93',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, Code93InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'CODE_128',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, Code128InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'ITF',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, ITFInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'PDF_417',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, Pdf417InputPage()),
              ),
              _divider,
              _ListTile(
                title: 'CODABAR',
                icon: CupertinoIcons.barcode,
                onTap: () => navigateTo(context, CodaBarInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'DATA_MATRIX',
                icon: CupertinoIcons.qrcode,
                onTap: () => navigateTo(context, DataMatrixInputPage()),
              ),
              _divider,
              _ListTile(
                title: 'AZTEC',
                icon: CupertinoIcons.qrcode,
                onTap: () => navigateTo(context, AzTecInputPage()),
              ),
            ]),
          ),
        ], crossAxisAlignment: CrossAxisAlignment.start),
      )
    );
  }
}

class _ListTile extends ListTile {
  _ListTile({
    String title,
    IconData icon,
    Function onTap
  }): super(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15
    ),
    title: Row(
      children: [
        Icon(icon),
        SizedBox(width: 15),
        Text(title),
      ],
    ),
    visualDensity: VisualDensity.compact,
    onTap: onTap
  );
}
