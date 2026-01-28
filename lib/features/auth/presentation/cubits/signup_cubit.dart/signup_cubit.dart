import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/features/auth/domain/entities/user_entity.dart';
import 'package:thimar_app/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createAccountWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(failure.message));
      },
      (userEntity) {
        emit(SignupSuccess(userEntity));
      },
    );
  }
}
