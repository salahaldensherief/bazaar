import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/auth/presentation/views/widgets/passwoed_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/have_an_account.dart';
import 'custom_text_bottom.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height.h * .10.h),

              Image.asset(AssetsData.logo, height: size.height * 0.10.h),
              SizedBox(height: size.height.h * .05.h),

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
                prefixIcon: Icon(Icons.person, size: 26.sp),
                hintText: 'User name',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 24.h),

              CustomTextFormField(
                prefixIcon: Icon(Icons.email, size: 26.sp),
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),

              CustomTextFormField(
                prefixIcon: Icon(Icons.phone, size: 26.sp),
                hintText: 'Phone Number',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 24.h),
              const PasswordField(hintText: 'Password'),
              SizedBox(height: 24.h),
              const PasswordField(hintText: 'Confirm password'),

              SizedBox(height: 40.h),
              CustomTextBottom(text: 'Sign up'),
              SizedBox(height: 24.h),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
