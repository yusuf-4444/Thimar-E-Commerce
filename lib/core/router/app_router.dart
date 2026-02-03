import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/di/dependency_injection.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/custom_nav_bar.dart';
import 'package:thimar_app/features/auth/domain/repos/auth_repo.dart';
import 'package:thimar_app/features/auth/presentation/cubits/signin_cubit.dart/signin_cubit.dart';
import 'package:thimar_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:thimar_app/features/auth/presentation/views/login_view.dart';
import 'package:thimar_app/features/auth/presentation/views/register_view.dart';
import 'package:thimar_app/features/home/presentation/views/home_view.dart';
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
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SigninCubit(getIt<AuthRepo>()),
            child: const LoginView(),
          ),
        );
      case AppRoutes.navBar:
        return CupertinoPageRoute(builder: (_) => const CustomNavBar());
      case AppRoutes.register:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(getIt<AuthRepo>()),
            child: const RegisterView(),
          ),
        );
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => const HomeView());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
