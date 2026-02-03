import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:thimar_app/core/router/app_routes.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/error_message_helper.dart';
import 'package:thimar_app/features/auth/presentation/cubits/signin_cubit.dart/signin_cubit.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      bloc: BlocProvider.of<SigninCubit>(context),
      listenWhen: (previous, current) =>
          current is SigninSuccess || current is SigninFailure,
      listener: (context, state) {
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(getErrorMessageLogin(context, state.errorMessage)),
            ),
          );
        } else if (state is SigninSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome back, ${state.user.name}!')),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.navBar,
            (route) => false,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is SigninLoading ||
          current is SigninFailure ||
          current is SigninSuccess,
      builder: (context, state) {
        if (state is SigninLoading) {
          return ModalProgressHUD(
            inAsyncCall: true,
            color: AppColors.primaryColor,
            progressIndicator: const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
            child: LoginViewBody(),
          );
        }
        return LoginViewBody();
      },
    );
  }
}
