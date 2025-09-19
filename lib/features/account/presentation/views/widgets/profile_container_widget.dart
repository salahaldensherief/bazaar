import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';

class ProfileContainersWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String img;
  const ProfileContainersWidget({
    super.key, this.onTap, required this.title, required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Container(
          height: 62.h,
          decoration: BoxDecoration(
            color: AppColors.backgraoundColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black10,
                spreadRadius: 2.r,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                SvgPicture.asset(img),
                SizedBox(width: 20.w),
                Text(
                title,
                  style: TextStyles.semiBold13,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
