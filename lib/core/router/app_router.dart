import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/features/login/presentation/views/login_view.dart';
import 'package:thimar_app/features/login/presentation/views/register_view.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:thimar_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_) => const SplashView());
      case AppRoutes.onBoarding:
        return CupertinoPageRoute(builder: (_) => const OnBoardingView());
      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => const LoginView());
      case AppRoutes.register:
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
