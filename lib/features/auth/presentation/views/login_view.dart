import 'package:Bazaar/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/views/widgets/bottom_nav_bar.dart';
import '../cubits/signin/sign_in_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'loginview';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
         Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMassege)));
        }
      },
      builder: (context, state) {
        return  LoginViewBody();
      },
    );
  }
}
