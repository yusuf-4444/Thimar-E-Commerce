import 'package:get_it/get_it.dart';
import 'package:thimar_app/core/services/firebase_auth_service.dart';
import 'package:thimar_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:thimar_app/features/auth/domain/repos/auth_repo.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt()));
}
