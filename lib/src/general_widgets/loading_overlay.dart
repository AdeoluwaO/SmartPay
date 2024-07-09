import 'package:flutter/material.dart';
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
        return Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            child: AppImageView(
              lottiePath: AppImages.loadingAnimation,
            ),
          ),
        );
      },
    );
    ;
  }
}
