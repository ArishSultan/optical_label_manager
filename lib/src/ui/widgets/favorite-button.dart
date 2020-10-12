import 'package:flutter/cupertino.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FavoriteButton extends StatefulWidget {
  final Output output;
  FavoriteButton(this.output);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await widget.output.toggleFavorite();
        setState(() {});
      },
      child: Icon(widget.output.isFavorite
        ? CupertinoIcons.heart_fill
        : CupertinoIcons.heart, color: CupertinoColors.systemPink)
    );
  }
}
