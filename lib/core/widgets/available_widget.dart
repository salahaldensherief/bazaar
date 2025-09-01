import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class AvailableWidget extends StatelessWidget {
  const AvailableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.black10,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.check,
            color: AppColors.black,
            size: 14.w,
          ),
          Text(
            'Available',
            style: TextStyles.semiBold10.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
