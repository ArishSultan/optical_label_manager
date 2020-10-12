import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:optical_label_manager/src/ui/pages/output_page.dart';
import 'package:optical_label_manager/src/ui/widgets/favorite-button.dart';
import 'package:optical_label_manager/src/utils/custom-navigator.dart';
import 'package:intl/intl.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key key,
    @required this.output,
  }) : super(key: key);

  final Output output;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, OutputPage(output: output)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Center(
                child: Text(
                  output.name.substring(0, 1),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              SizedBox(width: 30.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      output.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(((DateTime date) =>
                            DateFormat('yyyy-MM-dd').format(date).toString() +
                            "  ${(date.hour % 12) == 0 ? 12 : date.hour % 12}:${date.minute} ${date.hour >= 12 ? 'PM' : 'AM'}")(
                        output.timestamp)),
                    Text(output.data),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 10.0),
                child: FavoriteButton(output),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
