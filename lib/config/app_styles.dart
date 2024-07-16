import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle normalBlack12spW500 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static TextStyle lineThroughSteelBlue12spW500 = const TextStyle(
    color: AppColors.steelBlue,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.steelBlue,
    decorationThickness: 2.0,
    fontSize: 12,
  );
  static TextStyle normalBlack14spW500 = const TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  static TextStyle boldBlack20spW500 = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
