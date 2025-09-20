import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';

class AddToCartContainer extends StatelessWidget {
    AddToCartContainer({this.icon, super.key, this.onTap, required this.title, });
  final String title;
final void Function()? onTap;
   String? icon;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap:onTap,
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
                SvgPicture.asset(icon!),
                SizedBox(width: 8,),
                Text(title, style: TextStyles.medium15.copyWith(
                    color: AppColors.whiteColor
                )),
              ],
            ),

          ),
        );

  }
}
