import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class BestSellerWidget extends StatefulWidget {
  const BestSellerWidget({super.key, this.isFav = false});
  final bool isFav;

  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 253.w,
          height: 312.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4.r,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 198.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(color: const Color(0xffF7F7FB)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.w,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 24.h,
                              width: 42.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.r),
                                color: AppColors.red,
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '-12%',
                                  style: TextStyles.semiBold14.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isFav = !_isFav;
                                });
                              },
                              icon: Icon(
                                _isFav ? Icons.favorite : Icons.favorite_border,
                                color: AppColors.primaryColor,
                                size: 24.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          AssetsData.WD,
                          height: 120.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'productName',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'category',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 72.w,
                            height:24.h,
                            decoration: BoxDecoration(
                              color: AppColors.black10,
                              borderRadius: BorderRadius.circular(2.r),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(

                                  Icons.check,
                                  color: AppColors.black,
                                  size: 14.w,
                                ),
                                Text(
                                  'Available',
                                  style: TextStyles.semiBold10
                                      .copyWith(color: AppColors.black),
                                ),

                              ],
                            ),
                          ),
                          Text(
                            '1200 L.E',
                            style: TextStyles.bold16.copyWith(
                              color: AppColors.primaryColor
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
