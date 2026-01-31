import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/features/auth/domain/entities/user_entity.dart';
import 'package:thimar_app/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signinWithFacebook();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity));
      },
    );
  }
}
