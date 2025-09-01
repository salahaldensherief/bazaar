import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class SellWidget extends StatelessWidget {
  const SellWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 42.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color: AppColors.red,
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          '-12%',
          style: TextStyles.semiBold14.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
