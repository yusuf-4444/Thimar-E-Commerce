import 'package:dartz/dartz.dart';
import 'package:thimar_app/core/errors/faliures.dart';
import 'package:thimar_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Faliures, UserEntity>> createAccountWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Faliures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Faliures, UserEntity>> signinWithGoogle();
  Future<Either<Faliures, UserEntity>> signinWithFacebook();
}
