import 'package:flutter/material.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/l10n/l10n.dart';

class TopSellingHeader extends StatelessWidget {
  const TopSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.topSelling,
            style: AppTextStyles.bold16.copyWith(color: Colors.black),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.topSelling);
            },
            child: Text(
              AppLocalizations.of(context)!.more,
              style: AppTextStyles.regular13.copyWith(color: AppColors.gray400),
            ),
          ),
        ],
      ),
    );
  }
}
