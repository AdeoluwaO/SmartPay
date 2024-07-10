import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageView(
              imagePath: AppImages.success,
            ),
            const Spacing.largeHeight(),
          const  CustomText(text: 'Congratulations, James'),
            Spacing.height(12.h),
          const  CustomText(
                text: 'You’ve completed the onboarding,\nyou can start using'),
            const Spacing.largeHeight(),
            Center(
              child: CustomButton(
                text: 'Get Started',
                onTap: () {
                  Navigator.pushReplacementNamed(context, RouteGenerator.dashboard);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
