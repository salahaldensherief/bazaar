import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/assets_images.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../search/presentation/views/search_page_view.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final bool isEnabled;
  const SearchBarWidget({super.key, this.searchController, required this.isEnabled});
  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SearchPageView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Container(
          height: 55.h,

          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: isEnabled,
                  controller: searchController,
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: 'Search Here ...',
                    hintStyle: TextStyles.medium14.copyWith(
                      color: AppColors.black40,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SvgPicture.asset(
                        AssetsData.search,
                        width: 22.w,
                        height: 22.h,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(minHeight: 32.h),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                width: 52.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: isRTL
                      ? BorderRadius.only(
                          topLeft: Radius.circular(4.r),
                          bottomLeft: Radius.circular(4.r),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(4.r),
                          bottomRight: Radius.circular(4.r),
                        ),
                ),
                child: SvgPicture.asset(
                  fit: BoxFit.scaleDown,
                  width: 30.w,
                  height: 30.h,
                  AssetsData.flter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
