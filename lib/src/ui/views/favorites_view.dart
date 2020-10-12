import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/widgets/list-item_widget.dart';

class FavoritesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final List<Output> _outputList = AppData().getFavoriteOutputs();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          top: 40.0, bottom: 73.0, left: 10.0, right: 10.0),
      itemCount: _outputList.length,
      itemBuilder: (context, index) {
        return ListItemWidget(output: _outputList.elementAt(index));
      },
    );
  }

}