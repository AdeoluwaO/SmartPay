import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartpay/src/core/routers/route_generator.dart';
import 'package:smartpay/src/core/uttils/index.dart';
import 'package:smartpay/src/features/dashboard/provider/dashboard_provider.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() => Provider.of<DashboardProvider>(context, listen: false).getSecret());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    (() async {
      if (AppLifecycleState.paused == state) {
      } else if (AppLifecycleState.resumed == state) {
        Navigator.pushReplacementNamed(context, RouteGenerator.setupPin,
            arguments: true);
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DashboardProvider>();

    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isLightMode = brightness == Brightness.light;
    return CustomScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: CustomText(
          text: 'Welcome',
          style: AppTextStyle.header2.copyWith(
              color: isLightMode ? AppColors.primaryColor : AppColors.grey50),
        ),
      ),
      body: state.isLoading
          ? const LoadingOverlay()
          : SafeArea(
              child: Center(
                child: CustomText(
                  text: state.homePageData?.secret ?? 'No Secret',
                  onTap: () {},
                  style: AppTextStyle.header2.copyWith(
                      color: isLightMode
                          ? AppColors.primaryColor
                          : AppColors.grey50),
                ),
              ),
            ),
    );
  }
}
