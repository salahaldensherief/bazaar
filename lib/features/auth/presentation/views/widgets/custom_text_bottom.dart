// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/text_styles.dart';


import '../../../../../core/utils/app_colors.dart';

class CustomTextBottom extends StatelessWidget {
  CustomTextBottom({ super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
        color: AppColors.primaryColor
        ),
        child: Center(child: Text(text,style: TextStyles.medium15.copyWith(
          color: AppColors.whiteColor
        ))),
      ),
    );
  }
}
