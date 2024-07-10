import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/domain/index.dart';
import 'package:smartpay/src/features/authentication/presentation/widgets/authentication_scaffoldd.dart';
import 'package:smartpay/src/features/authentication/provider/signup_provider.dart';
import 'package:smartpay/src/general_widgets/index.dart';
import 'package:smartpay/src/general_widgets/spacing.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({super.key, required this.params});
  final SignupParams params;

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  bool obscureText = true;
  bool isEnabled = false;
  String? selectedCountry;
  final _bioDataKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  String? country;
  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: true);
    final state = context.watch<SignupProvider>();
    print('PASSED IN EMAIL ${widget.params} BIO DATA ');
    return AuthenticationScaffold(
      title: 'Hey there! tell us a bit\nabout yourself',
      subbtitle: '',
      showAppBar: true,
      children: [
        Form(
          key: _bioDataKey,
          onChanged: () {
            setState(() {
              isEnabled = _bioDataKey.currentState!.validate();
            });
          },
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Full name',
                controller: fullNameController,
                validateFunction: AppValidators.notEmpty(),
              ),
              const Spacing.mediumHeight(),
              CustomTextField(
                hintText: 'Username',
                controller: userNameController,
                validateFunction: AppValidators.notEmpty(),
              ),
              const Spacing.mediumHeight(),
              CustomCountryPicker(
                hintText: 'Select Country',
                onCountryChanged: (p0) {
                  selectedCountry = p0;
                },
              ),
              const Spacing.mediumHeight(),
              CustomTextField(
                hintText: 'Password',
                obscureText: obscureText,
                controller: passwordController,
                validateFunction: AppValidators.minLength(6),
                suffixIcon: CustomIcon(
                  icon: obscureText ? Icons.visibility_off : Icons.visibility,
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacing.bigHeight(),
        CustomButton(
          text: 'Confirm',
          isEnabled: isEnabled,
          onTap: () async {
            if (selectedCountry == null || selectedCountry!.isEmpty) {
              showToast(message: 'Please Select a Country', isError: true);
              return;
            } else {
              await signupProvider.createUser(
                SignupParams(
                  fullName: fullNameController.text,
                  username: userNameController.text,
                  email: widget.params.email,
                  country: country,
                  password: passwordController.text,
                  deviceName: 'mobile',
                ),
              );
              if (state.createAccountResponse != null) {
                Navigator.pushNamed(context, RouteGenerator.setupPin);
              }
            }
          },
        ),
        if (state.isLoading) const LoadingOverlay()
      ],
    );
  }
}
