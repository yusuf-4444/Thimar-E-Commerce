import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thimar_app/core/router/router.dart';
import 'package:thimar_app/core/router/routes.dart';
import 'package:thimar_app/generated/l10n.dart';

void main() {
  runApp(ThimarApp());
}

class ThimarApp extends StatelessWidget {
  const ThimarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Thimar App',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Routes.splash,
      onGenerateRoute: Router.onGenerateRoute,
    );
  }
}
