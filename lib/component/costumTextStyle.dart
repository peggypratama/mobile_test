import 'package:flutter/material.dart';
import 'package:mobile_test/component/warna.dart';

class CostumTextStyle {
  static var textFormFieldRegular = const TextStyle(
    fontFamily: "Roboto",
    color: Warna.primary,
  );

  static var textFormFieldRegularMedium = const TextStyle(
    fontFamily: "Roboto",
    color: Warna.primary,
    fontWeight: FontWeight.w500,
  );

  static var textFormFieldRegularBold = const TextStyle(
    fontFamily: "Roboto",
    color: Warna.primary,
    fontWeight: FontWeight.w700,
  );

  static var textFormFieldRegularItalic = const TextStyle(
    fontFamily: "Roboto",
    color: Warna.primary,
    fontStyle: FontStyle.italic,
  );
}
