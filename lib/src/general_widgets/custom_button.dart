import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.color,
      this.textColor,
      this.width,
      this.text,
      this.onTap,
      this.padding,
      this.margin,
      this.height = 56,
      this.onRetry,
      this.isLoading = false,
      this.isEnabled = true,
      this.hasError = false,
      this.hasBorder = false,
      this.textStyle,
      this.prefixWidget,
      this.noRadius = false})
      : super(key: key);
  final Color? color, textColor;
  final TextStyle? textStyle;
  final String? text;
  final void Function()? onTap, onRetry;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final bool isLoading, isEnabled, hasError, hasBorder;
  final Widget? prefixWidget;
  final bool noRadius;
  @override
  Widget build(BuildContext context) {
    final bool hasFocus = FocusScope.of(context).hasFocus;
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return GestureDetector(
      onTap: hasError
          ? onRetry
          : isLoading
              ? null
              : (!isEnabled
                  ? null
                  : () {
                      if (hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      onTap?.call();
                    }),
      // borderRadius: BorderRadius.circular(8),
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          border: hasBorder ? Border.all(width: 1) : null,
          borderRadius: noRadius ? null : BorderRadius.circular(16),
          color: color ??
              (isEnabled
                  ? theme.colorScheme.surface
                  : (isLightMode
                      ? AppColors.grey100
                      : AppColors.grey100.withOpacity(0.3))),
        ),
        alignment: Alignment.center,
        width: width ?? size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixWidget != null) prefixWidget!,
            if (prefixWidget != null) const SizedBox(width: 4),
            if (!isLoading)
              CustomText(
                text: text ?? 'click',
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
                onTap: () {
                  onTap?.call();
                },
              ),
            if (isLoading) const CustomLoader()
          ],
        ),
      ),
    );
  }
}

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {Key? key,
      this.color,
      this.textColor,
      this.width,
      this.text,
      this.onTap,
      this.padding,
      this.margin,
      this.height = 56,
      this.onRetry,
      this.isLoading = false,
      this.isEnabled = true,
      this.hasError = false,
      this.textStyle,
      this.prefixWidget,
      this.child,
      this.noRadius = false})
      : super(key: key);
  final Color? color, textColor;
  final TextStyle? textStyle;
  final String? text;
  final Widget? child;
  final void Function()? onTap, onRetry;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final bool isLoading, isEnabled, hasError;
  final Widget? prefixWidget;
  final bool noRadius;
  @override
  Widget build(BuildContext context) {
    final bool hasFocus = FocusScope.of(context).hasFocus;
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return GestureDetector(
      onTap: hasError
          ? onRetry
          : isLoading
              ? null
              : (!isEnabled
                  ? null
                  : () {
                      if (hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      onTap?.call();
                    }),
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: isEnabled ? (isLightMode ? AppColors.grey200 : AppColors.grey50) : Colors.transparent),
          borderRadius: noRadius ? null : BorderRadius.circular(16),
          color: color ??
              (isEnabled
                  ? (isLightMode ? AppColors.grey50 : Colors.transparent)
                  : (isLightMode
                      ? AppColors.grey100
                      : AppColors.grey100.withOpacity(0.3))),
        ),
        alignment: Alignment.center,
        width: width ?? size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixWidget != null) prefixWidget!,
            if (prefixWidget != null) const SizedBox(width: 4),
            if (!isLoading)
              if (text != null)
                CustomText(
                  text: text ?? 'click',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                  onTap: () {
                    onTap?.call();
                  },
                )
              else
                child!,
            if (isLoading) const CustomLoader()
          ],
        ),
      ),
    );
  }
}
