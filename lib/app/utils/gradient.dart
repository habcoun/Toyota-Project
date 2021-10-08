import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red.shade900,
            Colors.red.shade700,
            Colors.red.shade500,
            Colors.red.shade700,
            Colors.red.shade900,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
