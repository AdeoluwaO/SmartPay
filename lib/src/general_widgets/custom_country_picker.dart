import 'package:flutter/material.dart';
import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:smartpay/src/core/uttils/index.dart';

class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,
    this.hintText,
    this.initalCountryValue,
    this.onCountryChanged,
  });
  final String? hintText;
  final String? initalCountryValue;

  final Function(String)? onCountryChanged;

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    return Transform.scale(
      scaleY: 1.1,
      child: CountryPickerPlus.country(
        searchDecoration: SearchDec(isLightMode: isLightMode, themeData: theme),
        hintText: widget.hintText,
        initialValue: widget.initalCountryValue,
        onSelected: widget.onCountryChanged,
        decoration:
            CountryPickerDec(isLightMode: isLightMode, themeData: theme),
      ),
    );
  }
}

CPPSFDecoration SearchDec(
    {required ThemeData themeData, required bool isLightMode}) {
  return CPPSFDecoration(
    innerColor: themeData.colorScheme.background,
    filled: true,
    hintStyle: AppTextStyle.bodySmall.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: isLightMode ? AppColors.primaryColor : AppColors.grey50),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.small),
      borderSide: BorderSide(
        color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
        width: 1,
      ),
    ),
    // height: 60,

    textStyle: AppTextStyle.bodyMedium.copyWith(
      color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.small),
      borderSide: BorderSide(
        color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
        width: 1,
      ),
    ),
  );
}

CPPFDecoration CountryPickerDec(
    {required ThemeData themeData, required bool isLightMode}) {
  return CPPFDecoration(
    suffixIcon: Icons.keyboard_arrow_down_rounded,
    innerColor: themeData.colorScheme.background,
    filled: true,
    hintStyle: AppTextStyle.bodySmall.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.small),
      borderSide: BorderSide(
        color: AppColors.error,
        width: 1,
      ),
    ),
    labelStyle: TextStyle(
      color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: AppColors.grey50,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: isLightMode ? AppColors.aquamarine : AppColors.grey50,
        width: 1,
      ),
    ),
    height: 60,
    showFlag: true,
    textStyle: AppTextStyle.bodySmall.copyWith(
      color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
    ),
  );
}
