import 'package:flutter/material.dart';
import 'package:thimar_app/core/constants/custom_app_bar.dart';
import 'package:thimar_app/l10n/l10n.dart';

import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, AppLocalizations.of(context)!.newAccount),
      body: RegisterViewBody(),
    );
  }
}
