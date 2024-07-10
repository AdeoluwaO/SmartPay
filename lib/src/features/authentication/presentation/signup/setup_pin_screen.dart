import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class SetupPinScreen extends StatefulWidget {
  const SetupPinScreen({super.key, required this.isFromLogin});
  final bool isFromLogin;

  @override
  State<SetupPinScreen> createState() => _SetupPinScreenState();
}

class _SetupPinScreenState extends State<SetupPinScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showToast(message: 'You can enter any pin');
  }
  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: widget.isFromLogin ? 'Enter Pin' : 'Set your PIN code',
      subbtitle: widget.isFromLogin
          ? 'To reveal your secret information\nPlease enter below'
          : 'We use state-of-the-art security measures to\nprotect your information at all times',
      showAppBar: widget.isFromLogin ? false : true,
      bottomItem: CustomButton(
        text: 'Create PIN',
        onTap: () {
          if (!widget.isFromLogin) {
            Navigator.pushNamed(context, RouteGenerator.success);
          } else {
            Navigator.pushReplacementNamed(context, RouteGenerator.dashboard);
          }
        },
      ),
      children: [
        CustomPinCodeField(
          onComplete: (pin) {
            if (!widget.isFromLogin) {
              Navigator.pushNamed(context, RouteGenerator.success);
            } else {
              Navigator.pushReplacementNamed(context, RouteGenerator.dashboard);
            }
          },
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
