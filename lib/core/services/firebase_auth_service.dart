import 'package:firebase_auth/firebase_auth.dart';
import 'package:thimar_app/core/errors/exceptions.dart';
import 'package:thimar_app/l10n/l10n.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(AppLocalizations.of(context)!.weakPasswordError);
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions('The account already exists for that email.');
      } else {
        throw CustomExceptions(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomExceptions(
        'An unknown error occurred, please try again later.',
      );
    }
  }
}
