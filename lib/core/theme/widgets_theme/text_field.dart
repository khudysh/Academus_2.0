import 'package:flutter/material.dart';
import 'package:academus_2/core/theme/const.dart';

class TextFieldThemes {
  static const light = InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.formColor, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.formColor, width: 2)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.formColor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.formColor, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.formColor, width: 2)),
      floatingLabelStyle: TextStyle(
        color: Const.formColor,
        fontSize: Const.fontSizeBody,
      ));

  static const dark = InputDecorationTheme(
    filled: true,
    fillColor: Const.darkFormColor,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.darkFormColor, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.darkFormColor, width: 2)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.darkFormColor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.darkFormColor, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Const.borderRadiusStandart),
          borderSide: BorderSide(color: Const.darkFormColor, width: 2)),
      floatingLabelStyle: TextStyle(
        color: Const.darkFormColor,
        fontSize: Const.fontSizeBody,
      ));
}