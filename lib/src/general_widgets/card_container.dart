import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/uttils/app_colors.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key,  this.title, this.subtitle, this.leading, this.trailing });
  final String? title, subtitle;
  final IconData? trailing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return GestureDetector(
      child: Container(
        height: 88.h,
        decoration: BoxDecoration(
            color: AppColors.grey50, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if(leading != null)
                leading!,
                const Spacing.width(18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title ?? 'Add title',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      text: subtitle ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isLightMode
                            ? AppColors.grey500
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if(trailing != null)
            CustomIcon(
              icon: trailing!,
              color: isLightMode ? AppColors.grey500 : AppColors.primaryColor,
            )!
          ],
        ),
      ),
    );
  }
}
