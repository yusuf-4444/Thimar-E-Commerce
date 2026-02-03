import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        style: AppTextStyles.regular13,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.regular13.copyWith(color: AppColors.gray400),
          prefixIcon: SizedBox(
            width: 20.w,
            height: 20.w,
            child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon)),
          ),
          suffixIcon: SizedBox(
            width: 20.w,
            height: 20.w,
            child: Center(child: SvgPicture.asset(Assets.imagesFilter)),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
