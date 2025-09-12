import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';

class ProductViewList extends StatelessWidget {
  const ProductViewList({
    super.key,
    this.isFav = false,
    required this.image,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
  });

  final bool isFav;
  final String image;
  final String productName;
  final String productCategory;
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: const BoxDecoration(color: Color(0xffF7F7FB)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 8.w,
                      ),
                    ),
                    Center(
                      child: Image.network(
                        image,
                        height: 60.h,
                        width: 61.164756774902344,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              productName ?? '',
                              style: TextStyles.medium15.copyWith(
                                overflow: TextOverflow.ellipsis,
                                wordSpacing: 1,
                              ),
                            ),
                          ),


                               Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: SvgPicture.asset(
                                    AssetsData.favAc,
                                    width: 20.w,
                                    height: 20.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        productCategory ?? '',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Container(
                            width: 72.w,
                            height: 24.h,
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
                                  style: TextStyles.semiBold10.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Text(
                              '${productPrice} L.E',
                              style: TextStyles.semiBold14.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
