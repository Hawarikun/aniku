import 'package:aniku/core/config/assets.dart';
import 'package:aniku/pages/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = "home";

  static final GoRouter goRouter = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: "/home",
        name: home,
        pageBuilder: _homePageBuilder,
      ),
    ],
  );

  void clearAndNavigate(String name) {
    while (goRouter.canPop() == true) {
      goRouter.pop();
    }
    goRouter.pushReplacementNamed(name);
  }

  static Page _homePageBuilder(context, state) {
    final size = MediaQuery.of(context).size;
    return transition(
      child: MaterialApp(
        home: AnimatedSplashScreen(
          splash: SizedBox(
            height: size.height * 0.3,
            child: SvgPicture.asset(logoApp),
          ),
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }

  static transition({required Widget child}) {
    return CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
