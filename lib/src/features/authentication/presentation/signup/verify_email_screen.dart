import 'dart:async';

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

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final otpController = TextEditingController();

  Timer? _timer;
  double _countdownTimeInSeconds = 60;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimer();
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_countdownTimeInSeconds == 0) {
        setState(() {
          _countdownTimeInSeconds = 60;
          _countdownTimeInSeconds = _countdownTimeInSeconds - 1;
        });
      } else if (_countdownTimeInSeconds <= 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    final signupProvider = Provider.of<SignupProvider>(context, listen: true);
    final state = context.watch<SignupProvider>();

    final countDownInt = _countdownTimeInSeconds.toInt();

    print('PASSED IN EMAIL ${widget.email} VERIFY EMAIL');
    return AuthenticationScaffold(
      title: 'Verify it’s you',
      subbtitle:
          'We sent a code to (${widget.email}).Enter it\nhere to verify your identity',
      showAppBar: true,
      bottomItem: CustomButton(
        text: 'Confirm',
        onTap: () {
          signupProvider.verifyEmailToken(
              SignupParams(email: widget.email, otp: otpController.text));
          if (state.verifyEmailResponse?.email != null &&
              state.verifyEmailResponse!.email!.isNotEmpty) {
            Navigator.pushNamed(context, RouteGenerator.bioData,
                arguments: widget.email);
          }
        },
      ),
      children: [
        CustomPinCodeField(
          controller: otpController,
          onComplete: (pin) {
            signupProvider
                .verifyEmailToken(SignupParams(email: widget.email, otp: pin));
          },
        ),
        const Spacing.largeHeight(),
        CustomText(
          text: 'Resend Code ${countDownInt != 0 ? countDownInt : ''}',
          onTap: () {
            if(countDownInt == 0)
            startTimer();
          },
          style: theme.textTheme.bodyLarge?.copyWith(
              color: isLightMode ? AppColors.grey600 : AppColors.grey50,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        if (state.isLoading) const LoadingOverlay()
      ],
    );
  }
}
