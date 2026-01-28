import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/constants/custom_button.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/services/shared_preferences_singelton.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_constants.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../../l10n/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController pageController;
  var currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
        print(currentIndex);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          DotsIndicator(
            position: currentIndex.toDouble(),
            animate: true,
            animationDuration: const Duration(milliseconds: 100),
            dotsCount: 2,
            decorator: DotsDecorator(
              color: currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
              activeColor: AppColors.primaryColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: currentIndex == 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: InkWell(
                child: CustomButton(
                  onTap: () {
                    SharedPreferencesSingelton.setBool(
                      AppConstants.kgetOnBoardingKey,
                      true,
                    );
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  text: AppLocalizations.of(context)!.startNow,
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
