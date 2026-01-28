import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/services/shared_preferences_singelton.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_constants.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/l10n/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.isSkipVisible,
  });

  final String image;
  final String backgroundImage;
  final Widget title;
  final String subTitle;
  final bool isSkipVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 450.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isSkipVisible,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      SharedPreferencesSingelton.setBool(
                        AppConstants.kgetOnBoardingKey,
                        true,
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.onBoardingTitle3,
                      style: AppTextStyles.regular13.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semibold13.copyWith(color: AppColors.gray500),
          ),
        ),
      ],
    );
  }
}
