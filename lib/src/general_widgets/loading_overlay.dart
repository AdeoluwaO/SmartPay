import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/src/core/uttils/app_images.dart';
import 'package:smartpay/src/general_widgets/index.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({super.key});

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
    late  final OverlayPortalController _overlayController ;
  @override
  void initState() {
    super.initState();
    _overlayController = OverlayPortalController()..show();
  }
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (context) {
        return Center(
          child: AppImageView(
            lottiePath: AppImages.loadingAnimation,
          ),
        );
      },
    );
    ;
  }
}
