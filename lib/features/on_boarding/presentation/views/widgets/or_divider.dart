import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/l10n/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xffDDDFDF),
            thickness: 1,
            height: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            AppLocalizations.of(context)!.or,
            style: AppTextStyles.semibold16.copyWith(color: Colors.black),
          ),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xffDDDFDF),
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}
