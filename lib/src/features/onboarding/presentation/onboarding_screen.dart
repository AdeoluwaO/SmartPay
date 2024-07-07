import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartpay/src/features/onboarding/widgets/onboarding_page.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomText(text: 'Skip'),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                pageSnapping: true,
                children: const [
                  const OnboardingPage(),
                  const OnboardingPage(),
                ],
              ),
            ),
            // Flexible(
            //   // flex: 0,
            //   fit: FlexFit.tight,
            //   child: PageView(
            //       pageSnapping: true,
            //       children: const [
            //         const OnboardingPage(),
            //         const OnboardingPage(),
            //       ],
            //     ),
            // ),
            CustomButton(
              text: 'Get Started',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
