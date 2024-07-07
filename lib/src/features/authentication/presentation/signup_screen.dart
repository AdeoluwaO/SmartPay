import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: CustomText(
          text: 'SignUP SCREEN',
          style: AppTextStyle.header1,
        ),
      ),
    );
  }
}
