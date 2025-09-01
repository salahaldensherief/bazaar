import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';

import '../utils/text_styles.dart';

class AddToCartContainer extends StatelessWidget {
  const AddToCartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
          width: 343.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.primaryColor,
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsData.cartPlus),
            SizedBox(width: 8,),
            Text('Add to Cart', style: TextStyles.medium15.copyWith(
              color: AppColors.whiteColor
            )),
          ],
        ),

        ),
    );
  }
}
