import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:thimar_app/core/constants/custom_button.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:thimar_app/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:thimar_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:thimar_app/l10n/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  bool isPasswordVisible = false;
  bool isTermsAccepted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? name, email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              Gap(24.h),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.fullName,
                onSaved: (value) {
                  name = value;
                },
              ),
              Gap(16.h),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
              ),
              Gap(16.h),
              // CustomTextFormField(
              //   label: AppLocalizations.of(context)!.password,
              //   isPassword: isPasswordVisible,
              //   suffixIcon: InkWell(
              //     onTap: () {
              //       setState(() {
              //         isPasswordVisible = !isPasswordVisible;
              //       });
              //     },
              //     child: isPasswordVisible
              //         ? Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
              //         : Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
              //   ),
              //   keyboardType: TextInputType.visiblePassword,
              //   onSaved: (value) {
              //     password = value;
              //   },
              // ),
              CustomPasswordFormField(
                isPasswordVisible: isPasswordVisible,
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              Gap(16.h),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                  setState(() {});
                },
              ),
              Gap(30.h),
              CustomButton(
                isEnabled: isTermsAccepted,
                text: AppLocalizations.of(context)!.createNewAccount,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    BlocProvider.of<SignupCubit>(
                      context,
                    ).signUp(name: name!, email: email!, password: password!);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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
      ),
    );
  }
}

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool>? onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() {
            isTermsAccepted = !isTermsAccepted;
            widget.onChanged?.call(isTermsAccepted);
          }),
          child: CustomCheckBox(isChecked: isTermsAccepted),
        ),
        SizedBox(width: 16.w), // بدل spacing
        Expanded(
          // ده الحل الأساسي
          child: Text.rich(
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
        ),
      ],
    );
  }
}

class CustomPasswordFormField extends StatelessWidget {
  const CustomPasswordFormField({
    super.key,
    this.onTap,
    this.onSaved,
    required this.isPasswordVisible,
  });

  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final bool isPasswordVisible;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: AppLocalizations.of(context)!.password,
      isPassword: isPasswordVisible,
      suffixIcon: InkWell(
        onTap: onTap,
        child: isPasswordVisible
            ? Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            : Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
      keyboardType: TextInputType.visiblePassword,
      onSaved: onSaved,
    );
  }
}
