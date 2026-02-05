import 'package:flutter/material.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';

AppBar buildAppBar(context, String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black,
    scrolledUnderElevation: 0,
    actions: actions,
  );
}
