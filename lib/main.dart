import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/di/dependency_injection.dart';
import 'package:thimar_app/core/router/app_router.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/utils/app_themes.dart';
import 'package:thimar_app/firebase_options.dart';
import 'package:thimar_app/l10n/l10n.dart';

import 'core/services/shared_preferences_singelton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingelton.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setUpGetIt();
  runApp(ThimarApp());
}

class ThimarApp extends StatelessWidget {
  const ThimarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'Thimar App',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: AppThemes.lightTheme,
      ),
    );
  }
}
