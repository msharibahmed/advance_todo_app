import 'package:flutter/material.dart';

class TextFieldTheme {
  static TextStyle textStyle(
      {Color color = Colors.black,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.w500,
      double letterSpacing = 0}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing);
  }

  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static const OutlineInputBorder outlineInputBorderFocused =
      OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff587792)),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static const OutlineInputBorder errOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffd52941)),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static const OutlineInputBorder errOutlineInputBorderFocused =
      OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static InputDecoration inputDecoration({required String hintText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextFieldTheme.textStyle(color: Colors.black38),
        errorBorder: errOutlineInputBorder,
        focusedErrorBorder: errOutlineInputBorderFocused,
        focusedBorder: outlineInputBorderFocused,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder);
  }
}
