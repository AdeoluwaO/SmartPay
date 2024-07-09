import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({
    Key? key,
    this.color,
    this.size = 35,
  }) : super(key: key);
  final Color? color;
  final double size;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: CupertinoActivityIndicator(
        color: widget.color ?? theme.colorScheme.secondary,
        animating: true,
      ),
    );
  }
}