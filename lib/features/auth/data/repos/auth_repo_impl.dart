import 'package:dartz/dartz.dart';
import 'package:thimar_app/core/errors/exceptions.dart';
import 'package:thimar_app/core/errors/faliures.dart';
import 'package:thimar_app/core/services/firebase_auth_service.dart';
import 'package:thimar_app/core/services/firestore_services.dart';
import 'package:thimar_app/core/utils/app_pathes.dart';
import 'package:thimar_app/features/auth/data/models/user_model.dart';
import 'package:thimar_app/features/auth/domain/entities/user_entity.dart';
import 'package:thimar_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreServices firestoreServices = FirestoreServices.instance;
  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Faliures, UserEntity>> createAccountWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
        name: name,
      );
      try {
        firestoreServices.setData(
          path: AppPathes.addUserData(user.uid),
          data: UserEntity(name: name, email: email, uId: user.uid).toMap(),
        );
        return Right(UserModel.fromFirebaseUser(user));
      } on Exception catch (e) {
        firestoreServices.deleteData(path: AppPathes.addUserData(user.uid));
        return Left(ServerFaliures(e.toString()));
      }
    } on CustomExceptions catch (e) {
      return Left(ServerFaliures(e.message));
    } catch (e) {
      return Left(ServerFaliures('An unknown error occurred.'));
    }
  }

  @override
  Future<Either<Faliures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      final userData = await firestoreServices.getDocument(
        path: AppPathes.addUserData(user.uid),
        builder: (data, documentID) {
          return UserModel.fromMap(data);
        },
      );

      print(userData.email);
      print(userData.name);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFaliures(e.message));
    } catch (e) {
      return Left(ServerFaliures('An unknown error occurred.'));
    }
  }

  @override
  Future<Either<Faliures, UserEntity>> signinWithGoogle() async {
    try {
      final userCredential = await firebaseAuthService.signInWithGoogle();
      final user = userCredential.user!;
      if (userCredential.additionalUserInfo != null &&
          userCredential.additionalUserInfo!.isNewUser) {
        firestoreServices.setData(
          path: AppPathes.addUserData(user.uid),
          data: UserEntity(
            name: user.displayName ?? '',
            email: user.email ?? '',
            uId: user.uid,
          ).toMap(),
        );
      } else {
        await firestoreServices.getDocument(
          path: AppPathes.addUserData(user.uid),
          builder: (data, documentID) {
            return UserModel.fromMap(data);
          },
        );
      }
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFaliures(e.message));
    } catch (e) {
      return Left(ServerFaliures('An unknown error occurred.'));
    }
  }

  @override
  Future<Either<Faliures, UserEntity>> signinWithFacebook() async {
    try {
      final userCredential = await firebaseAuthService.signInWithFacebook();
      final user = userCredential.user!;
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFaliures(e.message));
    } catch (e) {
      return Left(ServerFaliures('An unknown error occurred.'));
    }
  }
}
