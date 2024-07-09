import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor, backgroundColor, labelColor;
  final bool? autofocus;
  final String? label;
  final String? firstLabel;
  final String? lastLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading;
  final double borderRadius;

  final String? initialValue;

  const CustomTextField({
    Key? key,
    this.width,
    this.backgroundColor,
    this.isLoading = false,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.validateFunction,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.maxLength,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.firstLabel,
    this.lastLabel,
    this.inputFormatters,
    this.borderRadius = 8,
    this.initialValue,
    this.labelSize,
    this.labelColor,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: textTheme.headlineMedium?.copyWith(
              color: widget.labelColor ?? colorScheme.onBackground,
            ),
          ),
        TextFormField(
          maxLength: widget.maxLength,
          initialValue: widget.initialValue,
          textAlign: TextAlign.left,
          autofocus: widget.autofocus ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: widget.enabled,
          validator: widget.validateFunction != null
              ? widget.validateFunction!
              : (value) {
                  return null;
                },
          onSaved: (val) {
            error = widget.validateFunction!(val);
            setState(() {});
            widget.onSaved!(val!);
          },
          onChanged: (val) {
            widget.validateFunction != null
                ? error = widget.validateFunction!(val)
                : error = null;
            setState(() {});
            if (widget.onChange != null) widget.onChange!(val);
          },
          onTap: widget.onTap,
          style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: isLightMode ? AppColors.primaryColor : AppColors.white),
          cursorColor: isLightMode ? AppColors.grey900 : AppColors.grey50,
          key: widget.key,
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.obscureText!,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            filled: true,
            enabled: false,
            fillColor: widget.backgroundColor ??
                (isLightMode
                    ? AppColors.grey50
                    : AppColors.primaryColor.withOpacity(0.2)),
            hintText: widget.hintText,
            hintStyle: AppTextStyle.bodyLarge.copyWith(
                color: isLightMode ? AppColors.grey400 : AppColors.grey50),
            errorStyle: TextStyle(color: AppColors.error),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.grey50,
                width: 0.5,
              ),
            ),
            labelStyle: TextStyle(
              color: AppColors.grey50,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.grey50,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.grey50,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: isLightMode ? AppColors.aquamarine : AppColors.grey50,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    required this.onComplete,
    this.onChange,
    this.controller,
    this.obscureText,
    this.obscureCharacter,
    this.keyboardType,
    this.fieldBorderStyle,
    this.borderRadius,
    this.fieldBackgroundColor,
    this.activeBackgroundColor,
  });
  final Function(String pin) onComplete;
  final Function(String pin)? onChange;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? obscureCharacter;
  final TextInputType? keyboardType;
  final FieldBorderStyle? fieldBorderStyle;
  final BorderRadius? borderRadius;
  final Color? fieldBackgroundColor, activeBackgroundColor;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    final color =  isLightMode
          ? AppColors.grey50
          : AppColors.primaryColor.withOpacity(0.2);

    return PinCodeFields(
      length: 5,
      onComplete: onComplete,
      controller: controller,
      onChange: onChange,
      keyboardType: keyboardType ?? TextInputType.number,
      fieldBorderStyle: fieldBorderStyle ?? FieldBorderStyle.square,
      obscureCharacter: obscureCharacter ?? "⚫️",
      obscureText: obscureText ?? false,
      activeBorderColor: isLightMode ? AppColors.aquamarine : AppColors.grey50,
      activeBackgroundColor: activeBackgroundColor ?? color,
      fieldBackgroundColor:fieldBackgroundColor ??color,
      borderWidth: 1.0,
      fieldWidth: 50.w,
      fieldHeight: 56.h,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      // borderColor: color,
      responsive: true,
      textStyle: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: isLightMode ? AppColors.primaryColor : AppColors.white),
      animation: Animations.grow,
    );
  }
}
