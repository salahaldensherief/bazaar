import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';

class ProductViewList extends StatefulWidget {
  const ProductViewList({super.key, this.isFav = false});
  final bool isFav;

  @override
  State<ProductViewList> createState() => _ProductViewListState();
}

class _ProductViewListState extends State<ProductViewList> {
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isFav = !_isFav;
                                });
                              },
                              child: SvgPicture.asset(
                                _isFav ? AssetsData.favAc : AssetsData.fav,
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
                        'Category',
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
                              '1200 L.E',
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
