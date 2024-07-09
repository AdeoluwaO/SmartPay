import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return AuthenticationScaffold(
      title: 'Verify it’s you',
      subbtitle: 'We sent a code to (*****@mail.com ).Enter it\nhere to verify your identity',
      showAppBar: true,
      bottomItem: CustomButton(
        text: 'Confirm',
        onTap: () {
          Navigator.pushNamed(context, RouteGenerator.bioData);
        },
      ),
      children: [
        CustomPinCodeField(
          onComplete: (pin) {},
        ),
        const Spacing.largeHeight(),
        CustomText(
          text: 'Resend Code 30 secs',
          onTap: () {},
          style: theme.textTheme.bodyLarge?.copyWith(
              color: isLightMode ? AppColors.grey600 : AppColors.grey50,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
