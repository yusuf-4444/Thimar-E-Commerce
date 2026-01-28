import 'package:flutter/material.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.suffixIcon,
  });

  final bool isPassword;
  final TextInputType keyboardType;
  final String label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Color(0xffF9FAFA),
        filled: true,
        hintText: label,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.bold13.copyWith(color: AppColors.gray400),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
    );
  }
}
