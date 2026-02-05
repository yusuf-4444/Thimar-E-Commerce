import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/services/firebase_auth_service.dart';
import 'package:thimar_app/core/services/shared_preferences_singelton.dart';
import 'package:thimar_app/core/utils/app_constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _plantController;
  late AnimationController _swayController;
  late AnimationController _logoController;
  late AnimationController _bottomController;

  late Animation<Offset> _plantSlideAnimation;
  late Animation<double> _swayAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _bottomFadeAnimation;

  @override
  void initState() {
    super.initState();
    animations();
    _startAnimations();
    executeNavigation();
  }

  void _startAnimations() async {
    await _plantController.forward();
    _swayController.repeat();
    await _logoController.forward();
    await _bottomController.forward();
  }

  @override
  void dispose() {
    _plantController.dispose();
    _swayController.dispose();
    _logoController.dispose();
    _bottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SlideTransition(
              position: _plantSlideAnimation,
              child: AnimatedBuilder(
                animation: _swayAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _swayAnimation.value,
                    alignment: Alignment.topCenter,
                    child: child,
                  );
                },
                child: SvgPicture.asset(Assets.imagesPlant),
              ),
            ),
          ),

          ScaleTransition(
            scale: _logoScaleAnimation,
            child: FadeTransition(
              opacity: _logoFadeAnimation,
              child: SvgPicture.asset(Assets.imagesLogo),
            ),
          ),

          FadeTransition(
            opacity: _bottomFadeAnimation,
            child: SvgPicture.asset(
              Assets.imagesSplashBottom,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  void animations() {
    // Plant slide animation controller
    _plantController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _swayController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _bottomController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _plantSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _plantController, curve: Curves.easeOutBack),
        );

    _swayAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 0.05,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.05,
          end: -0.05,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -0.05,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
    ]).animate(_swayController);

    // Logo scale and fade
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    // Bottom fade in
    _bottomFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _bottomController, curve: Curves.easeIn));
  }

  void executeNavigation() {
    bool isFirstLaunch = SharedPreferencesSingelton.getBool(
      AppConstants.kgetOnBoardingKey,
    );
    Future.delayed(const Duration(seconds: 4), () {
      if (!isFirstLaunch) {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
      } else {
        FirebaseAuthService firebaseAuthService = FirebaseAuthService();
        if (firebaseAuthService.isLoggedIn()) {
          Navigator.pushReplacementNamed(context, AppRoutes.navBar);
          return;
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      }
    });
  }
}
