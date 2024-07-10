import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/features/authentication/provider/signup_provider.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _createAccountKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    final signupProvider = Provider.of<SignupProvider>(context, listen: true);
    final state = context.watch<SignupProvider>();

    return AuthenticationScaffold(
      title: 'Create a ',
      titleHilightedText: 'Smartpay\n',
      afterHilightedText: 'account',
      subbtitle: '',
      bottomItem: Text.rich(
        TextSpan(
          text: 'Already have an account? ',
          children: [
            TextSpan(
              text: 'Sign In',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isLightMode ? AppColors.primaryColor : AppColors.grey50,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.loginScreen);
                },
            ),
          ],
          style: theme.textTheme.bodyLarge?.copyWith(
              color: isLightMode ? AppColors.grey500 : AppColors.grey50),
        ),
      ),
      children: [
        Form(
          key: _createAccountKey,
          onChanged: () {
            setState(() {
              isEnabled = _createAccountKey.currentState!.validate();
            });
          },
          child: CustomTextField(
            hintText: 'Email',
            controller: emailController,
            validateFunction: AppValidators.email(),
          ),
        ),
        const Spacing.bigHeight(),
        CustomButton(
          text: 'Sign Up',
          isEnabled: isEnabled,
          onTap: () async {
            await signupProvider
                .getEmailToken(SignupParams(email: emailController.text));
            // print('RESPONSE IS ${signupProvider.tokenResponse?.token}');
            if (state.isLoading == false) {
              if (state.tokenResponse?.token != null &&
                  state.tokenResponse!.token!.isNotEmpty) {
                Navigator.pushNamed(context, RouteGenerator.verifyEmail,
                    arguments: SignupParams(
                        email: emailController.text,
                        otp: state.tokenResponse?.token));

                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AppDialogue(
                          title: 'CODE',
                          message: state.tokenResponse!.token.toString(),
                          height: 200.h,
                        );
                      },
                    );
                  },
                );
              }
            }
          },
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
        ),
        if (signupProvider.isLoading) const LoadingOverlay()
      ],
    );
  }
}
