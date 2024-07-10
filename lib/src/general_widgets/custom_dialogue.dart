import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class AppDialogue extends StatelessWidget {
  const AppDialogue({
    super.key,
    required this.title,
    required this.message,
    this.actionButtons,
    this.width,
    this.height,
  });
  final String title, message;
  final List<Widget>? actionButtons;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    return AlertDialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      content: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        height: height ?? 250,
        width: width ?? 600,
        decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.headlineLarge?.copyWith(
                  color:
                      isLightMode ? AppColors.primaryColor : AppColors.grey50),
              textAlign: TextAlign.center,
            ),
            const Spacing.mediumHeight(),
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                  color:
                      isLightMode ? AppColors.primaryColor : AppColors.grey50),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: actionButtons ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
