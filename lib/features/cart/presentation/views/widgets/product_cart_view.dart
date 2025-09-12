import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';

class ProductCartView extends StatefulWidget {
  const ProductCartView({super.key});

  @override
  State<ProductCartView> createState() => _ProductCartViewState();
}

class _ProductCartViewState extends State<ProductCartView> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          Container(
            width: 343.w,
            height: 122.h,
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
            child: Row(
              children: [
                Container(
                  height: 106.h,
                  width: 120.w,
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: const BoxDecoration(color: Color(0xffF7F7FB)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.w,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.r),
                                color: AppColors.red,
                              ),
                              child: Center(
                                child: Text(
                                  '-12%',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.semiBold14.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          AssetsData.ups,
                          height: 60.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Product Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Category',
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 8.h),

                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Text(
                                  '1200 L.E',
                                  style: TextStyles.medium15.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.backIconColor,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: SvgPicture.asset(
                                    AssetsData.plus,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Text(
                                quantity.toString(),
                                style: TextStyles.medium15.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(width: 16.w),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 0) quantity--;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),

                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.backIconColor,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),

                                  child: SvgPicture.asset(
                                    AssetsData.remove,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
