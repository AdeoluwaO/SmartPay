import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;

    return AuthenticationScaffold(
      title: 'Hi There! 👋',
      subbtitle: 'Welcome back, Sign in to your account',
      bottomItem: Text.rich(
        TextSpan(
          text: 'Don’t have an account? ',
          children: [
            TextSpan(
              text: 'Sign Up',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.pushReplacementNamed(context, RouteGenerator.createAccount);
              },
            ),
          ],
          style: theme.textTheme.bodyLarge?.copyWith(color: isLightMode ? AppColors.grey500: AppColors.grey50),
        ),
      ),
      children: [
        CustomTextField(
          hintText: 'Email',
          onChange: (p0) {},
        ),
        const Spacing.mediumHeight(),
        CustomTextField(
          hintText: 'Password',
          obscureText: obscureText,
          onChange: (p0) {},
          suffixIcon: CustomIcon(
            icon: obscureText ? Icons.visibility_off : Icons.visibility,
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        const Spacing.bigHeight(),
        CustomText(
          text: 'Forgot Password?',
          onTap: () {
            Navigator.pushNamed(context, RouteGenerator.forgotPassword);
          },
          style: AppTextStyle.bodyLarge.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacing.bigHeight(),
        CustomButton(
          text: 'Sign In',
          onTap: () {},
          // isEnabled: false,
        ),
        const Spacing.largeHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageView(
              svgPath: AppImages.rightLine,
            ),
            CustomText(
              text: 'OR',
              style: AppTextStyle.bodyMedium.copyWith(
                color: isLightMode ? AppColors.grey500 : AppColors.grey50,
              ),
            ),
            AppImageView(
              svgPath: AppImages.leftLine,
            ),
          ],
        ),
        const Spacing.bigHeight(),
        Row(
          children: [
            CustomBorderButton(
              width: 155.w,
              child: AppImageView(
                svgPath: AppImages.googleLogo,
              ),
            ),
            const Spacing.mediumWidth(),
            CustomBorderButton(
              width: 155.w,
              child: AppImageView(
                svgPath: AppImages.appleLogo,
              ),
            ),
          ],
        )
      ],
    );
  }
}
