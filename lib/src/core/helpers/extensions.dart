import 'package:flutter/material.dart';

extension TextThemeExtension  on TextTheme {
  //NOTE: STYLE NAMES ARE CUSTOM
  // TEXT STYLES NAME IN 'app_text_styles.dart
  TextStyle? getStyle(String styleName) {
    // print('STYLE NAME IS $styleName');
    switch (styleName) {
      case 'header1':
        return headlineLarge;
      case 'header2':
        return headlineMedium;
      case 'header3':
        return headlineSmall;
      case 'header4':
        return displayLarge;
      case 'header5':
        return displayMedium;
      case 'header6':
        return displaySmall;
      case 'bodyXLarge':
        return bodyLarge;
      case 'bodyMedium':
        return bodyMedium;
      case 'bodySmall':
        return bodySmall;
      case 'bodyLarge':
        return labelMedium;
      case 'bodyXSmall':
        return labelSmall;
      default:
        return bodyMedium;
    }
  }
}
