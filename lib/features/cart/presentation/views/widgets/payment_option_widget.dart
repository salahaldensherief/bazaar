import 'package:Bazaar/core/utils/app_colors.dart';
import 'package:Bazaar/core/utils/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/text_styles.dart';

class PaymentOptionWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final String icon;

  const PaymentOptionWidget({
    Key? key,
    required this.isSelected,
    required this.onTap,

   required this.icon, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey.shade400,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            Image.asset(
              height: 24.h,
            icon
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyles.medium15
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              onChanged: (value) {
                onTap();

              },

              activeColor:AppColors.primaryColor,

            ),
          ],
        ),
      ),
    );
  }
}
