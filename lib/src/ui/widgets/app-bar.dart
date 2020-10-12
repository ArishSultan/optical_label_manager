import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CustomAppBar({
    this.title,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (Navigator.of(context).canPop()) {
      leading = IconButton(
        icon: Icon(CupertinoIcons.arrow_left),
        onPressed: () => Navigator.of(context).pop()
      );
    }

    return AppBar(
      elevation: 0,
      leading: leading,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(title, style: TextStyle(fontFamily: 'Helvetica'),),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
