import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    required this.children,
  });
  final String title, subtitle, backgroundImage;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return Container(
      decoration: BoxDecoration(
          color: isLightMode ? AppColors.grey50 : null,
          image: DecorationImage(image: AssetImage(backgroundImage))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: (size.height * 0.5),
              child: Stack(
                children: children,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: (size.height * 0.3),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.background.withOpacity(0.6),
                    theme.colorScheme.background,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.08,
                    0.2,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: isLightMode ? AppColors.grey900 : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacing.mediumHeight(),
                  CustomText(
                    text: subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isLightMode
                          ? AppColors.grey500
                          : AppColors.white.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
