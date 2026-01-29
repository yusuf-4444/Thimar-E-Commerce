import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @onboardingTitle1.
  ///
  /// In ar, this message translates to:
  /// **' مرحبًا بك في '**
  String get onboardingTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In ar, this message translates to:
  /// **'ثمار'**
  String get onboardingTitle2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In ar, this message translates to:
  /// **'تخط'**
  String get onBoardingTitle3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In ar, this message translates to:
  /// **'اكتشف تجربة تسوق فريدة مع ثمار. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'**
  String get onboardingTitle4;

  /// No description provided for @onboardingSecondPageTitle1.
  ///
  /// In ar, this message translates to:
  /// **'ابحث وتسوق'**
  String get onboardingSecondPageTitle1;

  /// No description provided for @onboardingSecondPageTitle2.
  ///
  /// In ar, this message translates to:
  /// **'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'**
  String get onboardingSecondPageTitle2;

  /// No description provided for @startNow.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ الآن'**
  String get startNow;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'هل نسيت كلمة المرور؟'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟'**
  String get dontHaveAccount;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'قم بإنشاء حساب'**
  String get register;

  /// No description provided for @signInWithGoogle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل بواسطة جوجل'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل بواسطة آبل'**
  String get signInWithApple;

  /// No description provided for @signInWithFacebook.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل بواسطة فيسبوك'**
  String get signInWithFacebook;

  /// No description provided for @or.
  ///
  /// In ar, this message translates to:
  /// **'أو'**
  String get or;

  /// No description provided for @newAccount.
  ///
  /// In ar, this message translates to:
  /// **'حساب جديد'**
  String get newAccount;

  /// No description provided for @fullName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم كامل'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get emailAddress;

  /// No description provided for @createPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة مرور'**
  String get createPassword;

  /// No description provided for @createNewAccount.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createNewAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'تمتلك حساب بالفعل؟ '**
  String get alreadyHaveAccount;

  /// No description provided for @loginNow.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل دخول'**
  String get loginNow;

  /// No description provided for @termsAndConditions.
  ///
  /// In ar, this message translates to:
  /// **'من خلال إنشاء حساب ، فإنك توافق على '**
  String get termsAndConditions;

  /// No description provided for @termsOfService.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والأحكام الخاصة بنا '**
  String get termsOfService;

  /// No description provided for @direction.
  ///
  /// In ar, this message translates to:
  /// **'rtl'**
  String get direction;

  /// No description provided for @validator.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get validator;

  /// No description provided for @weakPasswordError.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور ضعيفة جدًا'**
  String get weakPasswordError;

  /// No description provided for @emailAlreadyInUseError.
  ///
  /// In ar, this message translates to:
  /// **'الحساب موجود بالفعل بهذا الإيميل'**
  String get emailAlreadyInUseError;

  /// No description provided for @invalidEmailError.
  ///
  /// In ar, this message translates to:
  /// **'الإيميل غير صحيح'**
  String get invalidEmailError;

  /// No description provided for @unknownError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير متوقع'**
  String get unknownError;

  /// No description provided for @tryAgainLater.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ، برجاء المحاولة مرة أخرى لاحقًا'**
  String get tryAgainLater;

  /// No description provided for @userNotFound.
  ///
  /// In ar, this message translates to:
  /// **'المستخدم غير موجود'**
  String get userNotFound;

  /// No description provided for @wrongPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور غير صحيحة'**
  String get wrongPassword;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
