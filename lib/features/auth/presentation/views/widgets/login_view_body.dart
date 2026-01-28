import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:thimar_app/core/constants/custom_app_bar.dart';
import 'package:thimar_app/core/constants/custom_button.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/widgets/custom_social_button.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/widgets/or_divider.dart';
import 'package:thimar_app/l10n/l10n.dart';

import 'custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, AppLocalizations.of(context)!.login),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Gap(24.h),
              CustomTextFormField(label: AppLocalizations.of(context)!.email),
              Gap(16.h),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.password,
                isPassword: true,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.forgotPassword,
                    style: AppTextStyles.semibold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              Gap(33.h),
              CustomButton(
                text: AppLocalizations.of(context)!.login,
                style: AppTextStyles.bold16.copyWith(color: Colors.white),
                onTap: () {},
              ),
              Gap(33.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dontHaveAccount,
                    style: AppTextStyles.semibold16.copyWith(
                      color: AppColors.gray400,
                    ),
                  ),
                  Gap(5.w),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.register,
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(33.h),
              OrDivider(),
              Gap(31.h),
              SocialLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
