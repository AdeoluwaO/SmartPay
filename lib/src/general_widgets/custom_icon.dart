import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap, this.color,  this.size});
  final IconData icon;
  final double? size;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: color ?? theme.iconTheme.color,
        size: size,
      ),
    );
  }
}
