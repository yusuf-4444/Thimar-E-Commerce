import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/services/firebase_auth_service.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/l10n/l10n.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        AppLocalizations.of(context)!.goodMorning,
        style: AppTextStyles.regular16.copyWith(color: AppColors.gray400),
      ),
      subtitle: Text(
        FirebaseAuthService().getCurrentUser()?.displayName ?? '',
        style: AppTextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
      ),
      trailing: CircleAvatar(
        backgroundColor: Color(0xffEEF8ED),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
