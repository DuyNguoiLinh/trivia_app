import 'package:flutter/cupertino.dart';

import '../../../questions/presentation/screen/home_screen.dart';

class CustomPopRoute extends PageRouteBuilder {
  CustomPopRoute()
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      );

      final slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0.0, 1.0),
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      );

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
