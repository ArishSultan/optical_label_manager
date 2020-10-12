import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/pages/create-my-qr_page.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';
import 'package:optical_label_manager/src/utils/qr-type.dart';
import 'package:qrcode/qrcode.dart';

class ScannerView extends StatefulWidget {
  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  CaptureTorchMode _mode = CaptureTorchMode.off;
  final _controller = QRCaptureController();

  @override
  void initState() {
    super.initState();

    _controller.torchMode = _mode;
    _controller.onCapture((data) {
      _controller.pause();
      _insertData(data);
    });
  }

  _insertData(String data) {
    OutputType outputType = QRType.getType(data);
    Output output = Output(
      type: outputType,
      name: QRType.getName(outputType),
      data: data,
      timestamp: DateTime.now(),
    );
    AppData().saveOutput(output).then((value) async {
      await navigateTo(context, OutputPage(output: output));
      _controller.resume();
    });
  }

  // tel:0300
  // WIFI:
  // VCARD:
  // 12312323
  // 123123123

  @override
  Widget build(BuildContext context) {
    _controller.pause();
    _controller.resume();

    return Stack(children: [
      QRCaptureView(controller: _controller),
      SizedBox(
        height: 63 + MediaQuery.of(context).padding.top,
        child: AppBar(
          elevation: 0,
          leading: SizedBox(),
          backgroundColor: Colors.transparent,
          title: Row(children: [
            Tooltip(
              message: 'Turn Flash ON / OFF',
              child: IconButton(
                  icon: Icon(_flashIcon(_mode)),
                  onPressed: () {
                    if (_mode == CaptureTorchMode.off) {
                      _controller.torchMode = _mode = CaptureTorchMode.on;
                    } else {
                      _controller.torchMode = _mode = CaptureTorchMode.off;
                    }

                    setState(() {});
                  }),
            ),
            Tooltip(
              message: 'Read QR from image',
              child: IconButton(
                  icon: Icon(CupertinoIcons.doc_richtext), onPressed: () {}),
            ),
          ], mainAxisAlignment: MainAxisAlignment.center),
          actions: [
            Tooltip(
              message: 'Create My QR-Code',
              child: IconButton(
                  icon: Icon(CupertinoIcons.qrcode),
                  onPressed: () => navigateTo(context, CreateMyQrPage())),
            )
          ],
        ),
      ),
    ]);
  }

  static _flashIcon(CaptureTorchMode mode) {
    switch (mode) {
      case CaptureTorchMode.on:
        return CupertinoIcons.bolt_fill;
      case CaptureTorchMode.off:
        return CupertinoIcons.bolt_slash_fill;
    }
  }
}
