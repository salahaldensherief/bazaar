import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/home/data/repos/home_repo_impl.dart';
import 'package:mega_top/features/search/presentation/views/widgets/search_page_view_body.dart';
import '../../../../../core/services/api/dio_consumer.dart';
import '../../../../../core/services/getit/service_locator.dart' as di;
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../search/presentation/cubit/search_cubit.dart';

class SearchBarContainerWidget extends StatelessWidget {
  const SearchBarContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BlocProvider(
                    create: (context) => di.sl<SearchCubit>(),
                    child: SearchViewBody(),
                  ),
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
        child: Container(
          height: 55.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              SizedBox(width: 8.w),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsData.search,
                      width: 22.w,
                      height: 22.h,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Search here ...',
                      style: TextStyles.medium14.copyWith(
                        color: AppColors.black40,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
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
                  AssetsData.flter,
                  fit: BoxFit.scaleDown,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
