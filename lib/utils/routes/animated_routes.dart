import 'package:flutter/material.dart';

class CustomAnimationPageRouteBuilder extends PageRouteBuilder {
  final Widget child;
  CustomAnimationPageRouteBuilder({required this.child})
      : super(
            pageBuilder: (context, animation1, animation2) => child,
            transitionsBuilder: (context, animation1, animation2, child) =>
                RotationTransition(
                  turns: animation1,
                  child: ScaleTransition(
                      scale: animation1,
                      child: FadeTransition(opacity: animation1, child: child)),
                ),
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1));
}
