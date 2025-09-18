import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';

class CheckoutBotton extends StatelessWidget {
  const CheckoutBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Container(
        width: 343.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                '2 products : ',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                '700 L.E',
                style: TextStyles.medium15.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Spacer(),
              Text(
                'Checkout',
                style: TextStyles.medium15.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(AssetsData.checkout, width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
