import 'package:flutter/material.dart';
import 'package:thimar_app/l10n/l10n.dart';

String getErrorMessageSignUp(BuildContext context, String errorCode) {
  final localizations = AppLocalizations.of(context)!;

  switch (errorCode) {
    case 'weak-password':
      return localizations.weakPasswordError;
    case 'email-already-in-use':
      return localizations.emailAlreadyInUseError;
    case 'invalid-email':
      return localizations.invalidEmailError;
    case 'network-request-failed':
      return localizations.tryAgainLater;
    default:
      return localizations.unknownError;
  }
}

String getErrorMessageLogin(BuildContext context, String errorCode) {
  final localizations = AppLocalizations.of(context)!;

  switch (errorCode) {
    case 'user-not-found':
      return localizations.userNotFound;
    case 'wrong-password':
      return localizations.wrongPassword;
    case 'network-request-failed':
      return localizations.tryAgainLater;
    default:
      return localizations.unknownError;
  }
}
