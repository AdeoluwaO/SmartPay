import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/app_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers:appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const OnboardingScreen(),
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        );
      },
    );
  }
}
