import 'package:flutter/material.dart';
import 'package:tictactoe/Resources/Colors/app_Colors.dart';

class AppTextStyles {
  static TextStyle whiteFontTextStyle = const TextStyle(
    fontSize: 15,
    letterSpacing: 3,
    fontFamily: 'GoogleFont',
    color: AppColors.primaryColor,
  );

  static whiteFontStyle(double size) {
    return TextStyle(
      fontSize: size,
      letterSpacing: 3,
      fontFamily: 'GoogleFont',
      color: AppColors.primaryColor,
    );
  }

  static blackFontStyle(double size) {
    return TextStyle(
      fontSize: size,
      letterSpacing: 3,
      fontFamily: 'GoogleFont',
      color: AppColors.secondaryColor,
    );
  }
}
