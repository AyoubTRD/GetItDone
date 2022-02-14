import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget Function(BuildContext, Animation<double>, Animation<double>)
      builder;
  final Duration duration;

  SlideRoute(
      {required this.builder,
      this.duration = const Duration(milliseconds: 300)})
      : super(
          pageBuilder: builder,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutQuart,
              ),
            );
            return SlideTransition(
              position: slideAnimation,
              child: child,
            );
          },
        );
}
