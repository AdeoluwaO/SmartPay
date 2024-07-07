import 'package:flutter/material.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/authentication/presentation/signup_screen.dart';
import 'package:smartpay/src/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
