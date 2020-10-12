import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart' as saver;
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/widgets/output-header.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OutputPage extends StatefulWidget {
  final Output output;
  final bool toSave;

  OutputPage({@required this.output, this.toSave = false})
      : assert(output != null);

  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  final _key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.toSave) AppData().saveOutput(widget.output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(children: [
          OutputHeader(widget.output),
          _buildQrCode(widget.output.data),
          Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(blurRadius: 15, color: Colors.grey.shade300)
                  ]),
              child: Text(widget.output.data)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(children: [
              Spacer(),
              FlatButton.icon(
                  onPressed: () async {
                    final RenderRepaintBoundary boundary =
                        _key.currentContext.findRenderObject();

                    final byteData = await (await boundary.toImage())
                        .toByteData(format: ui.ImageByteFormat.png);

                    final file = File(
                        '${Directory.systemTemp.path}${DateTime.now()}.png');

                    await file.create(recursive: true);
                    await file.writeAsBytes(byteData.buffer.asUint8List());
                    await saver.GallerySaver.saveImage(file.path,
                        albumName: 'Optical Labels');

                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Image Saved to Gallery'),
                    ));
                  },
                  color: Colors.green,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  icon: Icon(CupertinoIcons.floppy_disk, size: 19),
                  label: Text('Save Image')),
              Spacer(),
              FlatButton.icon(
                  onPressed: () async {
                    final RenderRepaintBoundary boundary =
                        _key.currentContext.findRenderObject();

                    final byteData = await (await boundary.toImage())
                        .toByteData(format: ui.ImageByteFormat.png);

                    final file = File(
                        '${Directory.systemTemp.path}${DateTime.now()}.png');

                    await file.create(recursive: true);
                    await file.writeAsBytes(byteData.buffer.asUint8List());
                    await saver.GallerySaver.saveImage(file.path,
                        albumName: 'Optical Labels');

                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Image Saved to Gallery'),
                    ));
                  },
                  color: Colors.orange,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  icon: Icon(Icons.share, size: 19),
                  label: Text('Share')),
              Spacer()
            ]),
          )
        ]),
      ),
    );
  }

  _buildQrCode(String data) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 15, color: Colors.grey.shade300)
            ]),
        child: RepaintBoundary(
          key: _key,
          child: Container(color: Colors.white, child: QrImage(data: data)),
        ));
  }

  _build() {
    switch (widget.output.type) {
      case OutputType.url:
        // TODO: Handle this case.
        break;
      case OutputType.text:
        // TODO: Handle this case.
        break;
      case OutputType.contact:
        // TODO: Handle this case.
        break;
      case OutputType.email:
        // TODO: Handle this case.
        break;
      case OutputType.sms:
        // TODO: Handle this case.
        break;
      case OutputType.geo:
        // TODO: Handle this case.
        break;
      case OutputType.phone:
        // TODO: Handle this case.
        break;
      case OutputType.calendar:
        // TODO: Handle this case.
        break;
      case OutputType.wifi:
        // TODO: Handle this case.
        break;
      case OutputType.vCard:
        // TODO: Handle this case.
        break;
      case OutputType.ean_8:
      case OutputType.ean_13:
      case OutputType.upc_a:
      case OutputType.upc_e:
      case OutputType.itf:
      case OutputType.code_39:
      case OutputType.code_93:
      case OutputType.code_128:
      case OutputType.codabar:
      case OutputType.maxi_code:
      case OutputType.rss_14:
      case OutputType.rss_expanded:
      case OutputType.pdf_417:
        // TODO: Handle this case.
        break;
      // case OutptType.aztec:
      //   // TODO: Handle this case.
      //   break;
    }
  }
}
