import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/widgets/favorite-button.dart';

class OutputHeader extends StatefulWidget {
  final Output output;
  OutputHeader(this.output);

  @override
  _OutputHeaderState createState() => _OutputHeaderState();
}

class _OutputHeaderState extends State<OutputHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(CupertinoIcons.person),
      SizedBox(width: 15),
      Expanded(child: Text(widget.output.name)),
      FavoriteButton(widget.output)
    ]);
  }
}
