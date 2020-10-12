import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFieldTitle extends Padding {
  AppTextFieldTitle({
    IconData icon,
    String title
  }): super(
    padding: const EdgeInsets.only(bottom: 10),
    child: Wrap(children: [
      if (icon != null)
        Icon(icon, color: Colors.grey.shade800),
      if (icon != null)
        SizedBox(width: 15),

      Text(title, style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade800
      )),
    ], crossAxisAlignment: WrapCrossAlignment.center),
  );
}