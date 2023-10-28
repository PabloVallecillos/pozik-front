import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PozikCustomTransitionPage extends CustomTransitionPage<dynamic> {
  PozikCustomTransitionPage({
    super.key,
    required super.child,
  }) : super(
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child
    ) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 0.9,
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    },
  );
}
