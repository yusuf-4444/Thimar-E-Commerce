import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/l10n/l10n.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SocialLoginButton(
          icon: Assets.imagesGoogleIcon,
          text: AppLocalizations.of(context)!.signInWithGoogle,
          onTap: () {},
        ),
        Gap(12.h),
        _SocialLoginButton(
          icon: Assets.imagesApplIcon,
          text: AppLocalizations.of(context)!.signInWithApple,
          onTap: () {},
        ),
        Gap(12.h),
        _SocialLoginButton(
          icon: Assets.imagesFacebookIcon,
          text: AppLocalizations.of(context)!.signInWithFacebook,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const _SocialLoginButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: const Color(0xffDDDFDF), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.9),
          child: Row(
            children: [
              Align(
                alignment: AppLocalizations.of(context)!.direction == 'ltr'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: AppTextStyles.semibold16.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
