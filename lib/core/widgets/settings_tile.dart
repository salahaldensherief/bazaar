import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.iconImage,
    required this.title,
    this.isShow = false,
    this.onTap,
  });
  final bool? isShow;
  final String iconImage;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.gray5,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(iconImage, width: 20.w),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(title, style: TextStyles.semiBold13),
                ],
              ),
            ),

            SvgPicture.asset(AssetsData.arrowNav, width: 9.w),
          ],
        ),
      ),
    );
  }
}
