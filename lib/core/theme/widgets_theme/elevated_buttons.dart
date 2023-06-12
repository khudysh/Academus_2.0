import 'package:flutter/material.dart';

import 'package:academus_2/core/theme/const.dart';

class ElevatedButtonThemes {
  static final light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Const.tertiaryColor,
      backgroundColor: Const.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Const.borderRadiusLarge),
      ),
    ),
  );

  static final dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Const.tertiaryColor,
      backgroundColor: Const.darkPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Const.borderRadiusLarge),
      ),
    ),
  );
}