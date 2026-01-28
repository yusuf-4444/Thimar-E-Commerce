import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:thimar_app/core/constants/custom_button.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:thimar_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:thimar_app/l10n/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Gap(24.h),
            CustomTextFormField(label: AppLocalizations.of(context)!.fullName),
            Gap(16.h),
            CustomTextFormField(
              label: AppLocalizations.of(context)!.email,
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16.h),
            CustomTextFormField(
              label: AppLocalizations.of(context)!.password,
              isPassword: true,
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              keyboardType: TextInputType.visiblePassword,
            ),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                InkWell(
                  onTap: () =>
                      setState(() => isTermsAccepted = !isTermsAccepted),
                  child: CustomCheckBox(isChecked: isTermsAccepted),
                ),
                Text.rich(
                  softWrap: true,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.termsAndConditions,
                        style: AppTextStyles.semibold13.copyWith(
                          color: AppColors.gray400,
                        ),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.termsOfService,
                        style: AppTextStyles.semibold13.copyWith(
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Gap(30.h),
            CustomButton(
              text: AppLocalizations.of(context)!.createNewAccount,
              onTap: () {},
              style: AppTextStyles.bold16.copyWith(color: Colors.white),
            ),
            Gap(26.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.alreadyHaveAccount,
                  style: AppTextStyles.semibold16.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.loginNow,
                    style: AppTextStyles.semibold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
