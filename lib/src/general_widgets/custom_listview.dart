import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.children,
    this.shrinkWrap = false,
    this.padding,
  });
  final List<Widget> children;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: shrinkWrap,
      padding: padding,
      children: children,
    );
  }
}

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.shrinkWrap = false});
  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount ?? 0,
      shrinkWrap: shrinkWrap,
    );
  }
}

class CustomListViewSeperated extends StatelessWidget {
  const CustomListViewSeperated({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.shrinkWrap = false,
    required this.separatorBuilder,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;
  final int? itemCount;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: itemBuilder,
      itemCount: itemCount ?? 0,
      shrinkWrap: shrinkWrap,
      separatorBuilder: separatorBuilder,
    );
  }
}