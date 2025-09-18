import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/presentation/views/widgets/bottom_nav_bar.dart';
import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';
import 'custom_button.dart';

class WidgetEmpty extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const WidgetEmpty({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 150.h),
        SizedBox(height: 16.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.bold22.copyWith(color: AppColors.black),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.medium14.copyWith(color: AppColors.black12),
          ),
        ),
        SizedBox(height: 16.h),
        CustomButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
          },
          text: 'Continue Shopping',
          color: AppColors.whiteColor,
          colorSide: AppColors.primaryColor,
          fontColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
