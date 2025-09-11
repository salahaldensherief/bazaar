import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top/features/account/presentation/views/cubits/signout/sign_out_cubit.dart';
import 'package:mega_top/features/auth/presentation/views/login_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('log out success')));
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else if (state is SignOutFailure) {}
      },
      builder: (context, state) {
        return state is SignOutLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              )
            : GestureDetector(
                onTap: () {
                  context.read<SignOutCubit>().signOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.backIconColor,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: state is SignOutLoading
                                  ? const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.primaryColor,
                                    )
                                  : SvgPicture.asset(
                                      AssetsData.signOut,
                                      width: 20.w,
                                    ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text('Sign out', style: TextStyles.semiBold13),
                        ],
                      ),
                    ),
                    SvgPicture.asset(AssetsData.arrowNav, width: 9.w),
                  ],
                ),
              );
      },
    );
  }
}
