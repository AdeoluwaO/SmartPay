import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/index.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: AppColors.white,
      error: AppColors.error,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      brightness: Brightness.light,
      surface: AppColors.grey900,
    ),
    textTheme: AppTextTheme(
      header1: AppTextStyle.header1,
      header2: AppTextStyle.header2,
      header3: AppTextStyle.header3,
      header4: AppTextStyle.header4,
      header5: AppTextStyle.header5,
      header6: AppTextStyle.header6,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      bodyXLarge: AppTextStyle.bodyXLarge,
      bodyXSmall: AppTextStyle.bodyXSmall,
    ).textTheme(),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      background: AppColors.primaryColor,
      error: AppColors.error,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      brightness: Brightness.dark,
      surface: AppColors.grey50,
    ),
    textTheme: AppTextTheme(
      header1: AppTextStyle.header1.copyWith(color: AppColors.grey500),
      header2: AppTextStyle.header2.copyWith(color: AppColors.grey500),
      header3: AppTextStyle.header3.copyWith(color: AppColors.grey500),
      header4: AppTextStyle.header4.copyWith(color: AppColors.grey500),
      header5: AppTextStyle.header5.copyWith(color: AppColors.grey500),
      header6: AppTextStyle.header6.copyWith(color: AppColors.grey500),
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: AppColors.grey500),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(color: AppColors.grey500),
      bodySmall: AppTextStyle.bodySmall.copyWith(color: AppColors.grey500),
      bodyXLarge: AppTextStyle.bodyXLarge.copyWith(color: AppColors.grey500),
      bodyXSmall: AppTextStyle.bodyXSmall.copyWith(color: AppColors.grey500),
    ).textTheme(),
  );
}

class AppTextTheme {
  final TextStyle? header1;
  final TextStyle? header2;
  final TextStyle? header3;
  final TextStyle? header4;
  final TextStyle? header5;
  final TextStyle? header6;
  final TextStyle? bodyXLarge;
  final TextStyle? bodyLarge;
  final TextStyle? bodyMedium;
  final TextStyle? bodySmall;
  final TextStyle? bodyXSmall;
  const AppTextTheme({
    this.header1,
    this.header2,
    this.header3,
    this.header4,
    this.header5,
    this.header6,
    this.bodyXLarge,
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.bodyXSmall,
  });
  TextTheme textTheme({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? header4,
    TextStyle? header5,
    TextStyle? header6,
    TextStyle? bodyXLarge,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? bodyXSmall,
  }) {
    return TextTheme(
      headlineLarge: header1 ?? this.header1,
      headlineMedium: header2 ?? this.header2,
      headlineSmall: header3 ?? this.header3,
      displayLarge: header4 ?? this.header4,
      displayMedium: header5 ?? this.header5,
      displaySmall: header6 ?? this.header5,
      bodyLarge: bodyXLarge ?? this.bodyXLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelMedium: bodyLarge ?? this.bodyLarge,
      labelSmall: bodyXSmall ?? this.bodyXSmall,
    );
  }
}
