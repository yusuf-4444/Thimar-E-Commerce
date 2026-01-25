import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/router/routes.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:thimar_app/features/splash/presentation/views/splash_view.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => const SplashView());
      case Routes.onBoarding:
        return CupertinoPageRoute(builder: (_) => const OnBoardingView());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
