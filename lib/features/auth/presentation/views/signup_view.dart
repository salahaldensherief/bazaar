import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top/features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'package:mega_top/features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import 'package:mega_top/features/auth/presentation/views/widgets/sign_up_view_body.dart';

import 'login_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signupview';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
