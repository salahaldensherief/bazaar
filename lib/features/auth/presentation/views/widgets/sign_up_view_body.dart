import 'package:Bazaar/features/auth/presentation/views/widgets/passwoed_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/have_an_account.dart';
import '../../cubits/signin/sign_in_cubit.dart';
import '../../cubits/signup/sign_up_cubit.dart';
import 'custom_text_bottom.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpState state = context.watch<SignUpCubit>().state;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: context.read<SignUpCubit>().signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height.h * .1.h),

                SvgPicture.asset(AssetsData.logo2, height: size.height * 0.07.h),
                SizedBox(height: size.height.h * .03.h),

                const Text(
                  'Create a new account',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 40.h),

                CustomTextFormField(
                  controller: context.read<SignUpCubit>().signUpUsername,
                  prefixIcon: Icon(Icons.person, size: 26.sp),
                  hintText: 'User name',
                  textInputType: TextInputType.name,
                  validator: (value) =>
                      value!.isEmpty ? "Enter username" : null,
                ),
                SizedBox(height: 24.h),

                CustomTextFormField(
                  controller: context.read<SignUpCubit>().signUpEmail,
                  prefixIcon: Icon(Icons.email, size: 26.sp),
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) =>
                      value!.contains("@") ? null : "Enter valid email",
                ),
                SizedBox(height: 24.h),
                PasswordField(
                  validator: (value) =>
                      value!.length < 6 ? "Password too short" : null,

                  controller: context.read<SignUpCubit>().signUpPassword,
                  hintText: 'Password',
                ),

                SizedBox(height: 24.h),
                PasswordField(
                  hintText: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value !=
                        context.read<SignUpCubit>().signUpPassword.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40.h),
                state is SignUpLoading
                    ? const CircularProgressIndicator()
                    : CustomTextBottom(
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .signUpFormKey
                              .currentState!
                              .validate()) {
                            context.read<SignUpCubit>().SignUp();
                          }
                        },
                        text: 'Sign up',
                      ),
                SizedBox(height: 24.h),
                const HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
