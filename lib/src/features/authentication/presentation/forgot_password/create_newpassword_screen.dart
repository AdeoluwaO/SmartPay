import 'package:flutter/material.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool obscureOldPasswordTextField = true;
  bool obscureNewasswordTextField = true;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
        title: 'Create New Password',
        showAppBar: true,
        subbtitle:
            'Please, enter a new password below different from the previous password',
        bottomItem: CustomButton(
          text: 'Create new password',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, RouteGenerator.loginScreen, (route) => false,);
          },
        ),
        children: [
          CustomTextField(
            hintText: 'New Password',
            obscureText: obscureOldPasswordTextField,
            onChange: (p0) {},
            suffixIcon: CustomIcon(
              icon: obscureOldPasswordTextField
                  ? Icons.visibility_off
                  : Icons.visibility,
              onTap: () {
                setState(() {
                  obscureOldPasswordTextField = !obscureOldPasswordTextField;
                });
              },
            ),
          ),
          const Spacing.mediumHeight(),
          CustomTextField(
            hintText: 'Confirm Password',
            obscureText: obscureNewasswordTextField,
            onChange: (p0) {},
            suffixIcon: CustomIcon(
              icon: obscureNewasswordTextField
                  ? Icons.visibility_off
                  : Icons.visibility,
              onTap: () {
                setState(() {
                  obscureNewasswordTextField = !obscureNewasswordTextField;
                });
              },
            ),
          ),
        ]);
  }
}
