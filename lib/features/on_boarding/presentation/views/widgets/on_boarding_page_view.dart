import 'package:flutter/material.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:thimar_app/l10n/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isSkipVisible: true,
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.onboardingTitle1,
                style: AppTextStyles.bold23,
              ),
              Text(
                AppLocalizations.of(context)!.onboardingTitle2,
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle: AppLocalizations.of(context)!.onboardingTitle4,
        ),
        PageViewItem(
          isSkipVisible: false,
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.of(context)!.onboardingSecondPageTitle1),
            ],
          ),
          subTitle: AppLocalizations.of(context)!.onboardingSecondPageTitle2,
        ),
      ],
    );
  }
}
