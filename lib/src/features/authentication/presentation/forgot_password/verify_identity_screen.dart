import 'package:flutter/material.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
        title: 'Verify your identity',
        subbtitle: 'Where would you like ',
        svgIcon: AppImages.profileCard,
        subtitleHilightedText: 'Smartpay',
        afterHilightedSubtitleText: ' to send your security code?',
         bottomItem: CustomButton(
          text: 'Continue',
          onTap: () {
            Navigator.pushNamed(context, RouteGenerator.createNewPassword);
          },
        ),
        children: [
          CardContainer(
            title: 'Email',
            subtitle: 'A*******@mail.com',
            leading: 
                AppImageView(
                  svgPath: AppImages.checked,
                ),
            trailing:  Icons.mail,
          )
        ]);
  }
}
