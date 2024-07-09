import 'package:flutter/material.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    return AuthenticationScaffold(
        title: 'Passsword Recovery',
        subbtitle:
            'Enter your registered email below to receive password instructions',
        svgIcon: AppImages.padLock,
        bottomItem: CustomButton(
          text: 'Send me email',
          onTap: () {
            Navigator.pushNamed(context, RouteGenerator.verifyIdentity);
          },
        ),
        children: [
          CustomTextField(
            hintText: 'Email',
            onChange: (p0) {},
          )
        ]);
  }
}
