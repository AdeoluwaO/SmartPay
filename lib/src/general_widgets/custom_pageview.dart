import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.children,
    this.shrinkWrap = false,
    this.pageController,
    this.pageSnapping = true,
  });
  final List<Widget> children;
  final bool shrinkWrap, pageSnapping;
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: pageSnapping,
      controller: pageController,
      children: children,
    );
  }
}

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.shrinkWrap = false});
  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount ?? 0,
    );
  }
}
