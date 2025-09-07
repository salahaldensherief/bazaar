import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';
import 'package:mega_top/features/home/presentation/views/widgets/wishlist_view.dart';

import '../../../../../core/services/api/dio_consumer.dart';
import '../../../data/repos/home_repo_impl.dart';

class IconAppBar extends StatelessWidget {
  final String subTitle;
  final double radius;
  final bool showHeart, solidBell;
  const IconAppBar({
    super.key,
    required this.showHeart,
    required this.solidBell,
    required this.subTitle,
    required this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 40.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: radius,
              child: SvgPicture.asset(
                AssetsData.Frame,
                fit: BoxFit.contain,
                width: 64.w,
                height: 64.h,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text('Salah Eldin', style: TextStyles.medium15),
                Text(subTitle, style: TextStyles.regular13),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Visibility(
                  visible: showHeart,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.backIconColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WishlistView(
                              homeRepo: HomeRepoImpl(
                                api: DioConsumer(dio: Dio()),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Visibility(
                  visible: solidBell,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.backIconColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidBell,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
