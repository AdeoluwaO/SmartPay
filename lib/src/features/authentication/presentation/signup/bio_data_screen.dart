import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/features/authentication/provider/signup_provider.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({super.key, required this.email});
  final String email;

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  bool obscureText = true;

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  String? country;
  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: true);
    final state = context.watch<SignupProvider>();
    print('PASSED IN EMAIL ${widget.email} BIO DATA ');
    return AuthenticationScaffold(
      title: 'Hey there! tell us a bit\nabout yourself',
      subbtitle: '',
      showAppBar: true,
      children: [
        CustomTextField(
          hintText: 'Full name',
          controller: fullNameController,
        ),
        const Spacing.mediumHeight(),
        CustomTextField(
          hintText: 'Username',
          controller: userNameController,
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
          controller: passwordController,
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
            signupProvider.createUser(
              SignupParams(
                fullName: fullNameController.text,
                username: userNameController.text,
                email: '',
                country: country,
                password: passwordController.text,
                deviceName: '',
              ),
            );
            Navigator.pushNamed(context, RouteGenerator.setupPin);
          },
        ),
        if (state.isLoading) const LoadingOverlay()
      ],
    );
  }
}
