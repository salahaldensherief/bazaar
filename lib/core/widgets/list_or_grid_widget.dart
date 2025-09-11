import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/categories/presentation/views/widgets/filter_bottom_sheet.dart';
import '../../features/categories/presentation/views/widgets/sort_bottom_sheet.dart';
import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';
import 'custom_app_bar.dart';

class ListOrGridWidget extends StatelessWidget {
  final bool isGrid;
  final VoidCallback onToggle;

  const ListOrGridWidget({
    super.key,
    required this.isGrid,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.black5,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          onPressed: onToggle,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isGrid ? Icons.list : Icons.grid_view,
                color: AppColors.black,
              ),
              SizedBox(width: 8.w),
              Text(
                isGrid ? 'List' : 'Grid',
                style: TextStyles.medium15.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    children: [
                      CustomAppBar(
                        showBack: false,
                        centerTitle: false,
                        title: 'Sort by :',
                      ),
                      const SortBottomSheet(),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            width: 52.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.black5,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AssetsData.sort),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SafeArea(
                  top: true,
                  minimum: EdgeInsets.only(top: 15.h),
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      elevation: 3,
                      backgroundColor: AppColors.whiteColor,
                      title: Text(
                        'Filter by',
                        style: TextStyles.bold22.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.w,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.backIconColor,
                              ),
                              child: SvgPicture.asset(
                                AssetsData.exit,
                                width: 15.w,
                                height: 20.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: const FilterBottomSheet(),
                  ),
                );
              },
            );
          },
          child: Container(
            width: 52.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.black5,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AssetsData.flterblack),
            ),
          ),
        ),
      ],
    );
  }
}
