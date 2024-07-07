import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return Container(
      decoration: BoxDecoration(
          color: isLightMode ? AppColors.grey50 : null,
          image:
              const DecorationImage(image: AssetImage(AppImages.deviceImage1))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: (size.height * 0.5),
              child: Stack(
                children: [
                  Positioned(
                    top: 150,
                    left: 46,
                    child: AppImageView(svgPath: AppImages.security),
                  ),
                  Positioned(
                    bottom: 80,
                    right: 0,
                    child: AppImageView(svgPath: AppImages.chartSvg),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 0,
                    child: AppImageView(svgPath: AppImages.depositCard),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: (size.height * 0.4),
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
            ),
          ),
          
        ],
      ),
    );
  }
}
