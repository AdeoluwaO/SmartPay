import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class AuthenticationScaffold extends StatelessWidget {
  const AuthenticationScaffold(
      {super.key,
      this.svgIcon,
      required this.title,
      required this.subbtitle,
      required this.children,
      this.titleHilightedText,
      this.afterHilightedText,
      this.showAppBar = false,
      this.subtitleHilightedText,
      this.afterHilightedSubtitleText,
      this.bottomItem});
  final String title, subbtitle;
  final String? titleHilightedText,
      afterHilightedText,
      subtitleHilightedText,
      afterHilightedSubtitleText;
  final String? svgIcon;
  final List<Widget> children;
  final Widget? bottomItem;
  final bool showAppBar;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    return CustomScaffold(
      appBar: showAppBar
          ? AppBar(
              leadingWidth: 100.w,
              toolbarHeight: 68.h,
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomBorderButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomIcon(
                    icon: Icons.chevron_left_rounded,
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          children: [
            Expanded(
              child: CustomListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  if (svgIcon != null) const Spacing.bigHeight(),
                  if (svgIcon != null)
                    AppImageView(
                      alignment: Alignment.topLeft,
                      svgPath: svgIcon,
                    ),
                  const Spacing.bigHeight(),
                  Text.rich(
                    TextSpan(
                      text: title,
                      children: [
                        TextSpan(
                          text: titleHilightedText,
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: isLightMode
                                ? AppColors.primaryColor
                                : AppColors.grey50,
                          ),
                        ),
                        TextSpan(
                          text: afterHilightedText,
                        ),
                      ],
                      style: theme.textTheme.displayLarge?.copyWith(
                        color:
                            isLightMode ? AppColors.grey900 : AppColors.white,
                      ),
                    ),
                  ),
                  if (subbtitle.isNotEmpty) const Spacing.smallHeight(),
                  if (subbtitle.isNotEmpty)
                    Text.rich(
                      TextSpan(
                        text: subbtitle,
                        children: [
                          TextSpan(
                            text: subtitleHilightedText,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: isLightMode
                                  ? AppColors.primaryColor
                                  : AppColors.grey50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: afterHilightedSubtitleText,
                          ),
                        ],
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isLightMode
                              ? AppColors.grey500
                              : AppColors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                  const Spacing.largeHeight(),
                  ...children
                ],
              ),
            ),
            if (bottomItem != null) bottomItem!,
          ],
        ),
      ),
    );
  }
}
