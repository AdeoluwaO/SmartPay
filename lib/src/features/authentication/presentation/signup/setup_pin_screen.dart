import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class SetupPinScreen extends StatelessWidget {
  const SetupPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'Set your PIN code',
      subbtitle:
          'We use state-of-the-art security measures to\nprotect your information at all times',
      showAppBar: true,
      bottomItem: CustomButton(
        text: 'Create PIN',
        onTap: () {
          Navigator.pushNamed(context, RouteGenerator.success);
        },
      ),
      children: [
        CustomPinCodeField(
          onComplete: (pin) {},
          fieldBorderStyle: FieldBorderStyle.bottom,
          borderRadius: BorderRadius.zero,
          obscureText: true,
          fieldBackgroundColor: AppColors.transparent,
          activeBackgroundColor: AppColors.transparent,
        ),
      ],
    );
  }
}
