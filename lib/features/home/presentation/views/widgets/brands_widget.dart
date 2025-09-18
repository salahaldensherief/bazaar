import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';

class BrandsWidget extends StatelessWidget {
  final String imagePath;
  const BrandsWidget({super.key, required this.imagePath, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:60.w,
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 6.w,vertical:8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4.r,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          width: 40.w,
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
