import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body, this.appBar});
  final Widget body;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBar,
      backgroundColor: theme.colorScheme.background,
      body: body,
    );
  }
}
