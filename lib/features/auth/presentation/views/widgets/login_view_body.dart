import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';
import 'package:mega_top/features/auth/presentation/views/widgets/passwoed_field.dart';
import 'package:mega_top/features/home/presentation/views/home_view.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/dont_have_an_account_widget.dart';
import 'custom_text_bottom.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height.h * .10.h),
              Image.asset(AssetsData.logo, height: size.height * 0.10),
              SizedBox(height: size.height.h * .05.h),

              const Text(
                'Sign in to continue',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: size.height * 0.10.h),
               CustomTextFormField(
                prefixIcon: Icon(Icons.email, size: 26.sp),
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              const PasswordField(hintText: 'Password'),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyles.medium14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextBottom(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  },
                  text: 'Login'),
              SizedBox(height: 24.h),
              const DontHaveAnAccountWidget(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
