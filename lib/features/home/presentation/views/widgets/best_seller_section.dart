import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';


class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.bold23.copyWith(fontWeight: FontWeight.w700)),
          Row(
            children: [
              Text(
              'View all',
                style:TextStyles.medium15.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700)
              ),
              SizedBox(width: 4.w,),
              Icon(
                Icons.arrow_forward_ios,
                size: 10.w,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
