import 'package:flutter/material.dart';
// import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/core/helpers/extensions.dart';
import 'package:smartpay/src/core/uttils/index.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.onTap,
    this.overflow
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Text(
        text,
        style: style ?? AppTextStyle.bodyMedium,
        textAlign: textAlign,
        overflow: overflow,
      ),
    );
  }
}
