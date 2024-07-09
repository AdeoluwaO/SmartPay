import 'package:flutter/material.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({super.key});

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {

    return AuthenticationScaffold(
      title: 'Hey there! tell us a bit\nabout yourself',
      subbtitle: '',
      showAppBar: true,
      children: [
        CustomTextField(
          hintText: 'Full name',
          onChange: (p0) {},
        ),
        const Spacing.mediumHeight(),
        CustomTextField(
          hintText: 'Username',
          onChange: (p0) {},
        ),
        const Spacing.mediumHeight(),
        CustomTextField(
          hintText: 'Select Country',
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
        CustomButton(
          text: 'Confirm',
          onTap: () {
            Navigator.pushNamed(context, RouteGenerator.setupPin);
          },
        )
      ],
    );
  }
}
