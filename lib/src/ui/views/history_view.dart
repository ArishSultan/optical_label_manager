import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/widgets/list-item_widget.dart';

class HistoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final List<Output> _outputList = AppData().getOutputs();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:
          EdgeInsets.only(top: 40.0, bottom: 73.0, left: 10.0, right: 10.0),
      itemCount: _outputList.length,
      itemBuilder: (context, index) {
        return ListItemWidget(output: _outputList.elementAt(index));
      },
    );
  }
}
