import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:thimar_app/core/constants/custom_app_bar.dart';
import 'package:thimar_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:thimar_app/l10n/l10n.dart';

import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, AppLocalizations.of(context)!.newAccount),
      body: RegisterViewBodyBlocConsumer(),
    );
  }
}

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      bloc: BlocProvider.of<SignupCubit>(context),
      listenWhen: (previous, current) =>
          current is SignupSuccess || current is SignupFailure,
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome, ${state.userEntity.name}!')),
          );
        }
      },
      buildWhen: (previous, current) => current is SignupLoading,
      builder: (context, state) {
        if (state is SignupLoading) {
          return ModalProgressHUD(inAsyncCall: true, child: RegisterViewBody());
        }
        return RegisterViewBody();
      },
    );
  }
}
