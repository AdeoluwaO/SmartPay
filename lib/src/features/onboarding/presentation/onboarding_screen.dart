import 'package:flutter/material.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/onboarding/widgets/onboarding_page.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final PageController pageController = PageController();
    return CustomScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomText(
              text: 'Skip',
              style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.aquamarine, fontWeight: FontWeight.w600),
              onTap: () {
                Navigator.pushReplacementNamed(context, RouteGenerator.loginScreen);
              },
            ),
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
              child: CustomPageView(
                pageController: pageController,
                children: [
                  OnboardingPage(
                    backgroundImage: AppImages.deviceImage1,
                    title: 'Finance app the safest\nand most trusted',
                    subtitle:
                        'Your finance work starts here. Our here to help\nyou track and deal with speeding up your\ntransactions.',
                    children: [
                      Positioned(
                        top: 150,
                        left: 46,
                        child: AppImageView(svgPath: AppImages.security),
                      ),
                      Positioned(
                        bottom: 80,
                        right: 0,
                        child: AppImageView(svgPath: AppImages.chartSvg),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 0,
                        child: AppImageView(svgPath: AppImages.depositCard),
                      ),
                    ],
                  ),
                  OnboardingPage(
                    backgroundImage: AppImages.deviceImage2,
                    title: 'The fastest transaction\nprocess only here',
                    subtitle:
                        'Get easy to pay all your bills with just a few\nsteps. Paying your bills become fast and\nefficient.',
                    children: [
                      Positioned(
                        top: 150,
                        left: 46,
                        child: AppImageView(svgPath: AppImages.paymentCard),
                      ),
                      Positioned(
                        bottom: 50,
                        right: 20,
                        child: AppImageView(svgPath: AppImages.contactCard),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Get Started',
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 370),
                    curve: Curves.decelerate);
                    if(pageController.offset >= pageController.position.maxScrollExtent)
                    Navigator.pushReplacementNamed(context, RouteGenerator.loginScreen);
                // print('MAX SCOLL EXTENT ${pageController.position.maxScrollExtent} OFFSSET IS ${pageController.offset}');
              },
            )
          ],
        ),
      ),
    );
  }
}
