import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Container(
        width: 14.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: !isChecked ? Border.all(color: AppColors.gray400) : null,
        ),
        child: isChecked
            ? Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SvgPicture.asset(
                    Assets.imagesCheck,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
