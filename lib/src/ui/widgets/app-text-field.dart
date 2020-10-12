import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends TextFormField {
  AppTextField({
    String label,
    String value,
    Widget prefix,
    int maxLines = 1,
    Function(String val) onSaved,
    Function(String val) validator,
  }) : super(
            maxLines: maxLines,
            initialValue: value,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                isDense: true,
                prefix: prefix,
                labelText: label,
                alignLabelWithHint: true,
                border: OutlineInputBorder()),
            onSaved: onSaved);
}

class AppTextFieldAlt extends CupertinoTextField {
  AppTextFieldAlt({
    int maxLines = 1,
    String placeholder,
    Function(String) onSaved,
    TextEditingController controller,
    TextInputType textInputType,
    int maxLength,
  }) : super(
            maxLength: maxLength,
            maxLines: maxLines,
            controller: controller,
            onSubmitted: onSaved,
            keyboardType: textInputType,
            placeholderStyle: TextStyle(color: Colors.grey.shade400),
            style: TextStyle(color: Colors.grey.shade600),
            clearButtonMode: OverlayVisibilityMode.editing,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade400),
            ),
            placeholder: placeholder);
}
