import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/sell_widget.dart';

import '../utils/app_colors.dart';
import '../utils/assets_images.dart';
import '../utils/text_styles.dart';
import 'available_widget.dart';

class ProductViewGrid extends StatefulWidget {
  const ProductViewGrid({
    super.key,
    this.isFav = false,
    required this.width,
    required this.height,
    required this.imageHeight,
  });
  final double width;
  final double height;
  final bool isFav;
  final double imageHeight;
  @override
  State<ProductViewGrid> createState() => _ProductViewGridState();
}

class _ProductViewGridState extends State<ProductViewGrid> {
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
        Expanded(
          child: Container(
            width: widget.width,
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
                    height: 129.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(color: const Color(0xffF7F7FB)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4,left: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SellWidget(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isFav = !_isFav;
                                  });
                                },
                                icon: Icon(
                                  _isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: AppColors.primaryColor,
                                  size: 24.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            AssetsData.ups,
                            height: widget.imageHeight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AvailableWidget(),
                            Text(
                              '1200 L.E',
                              style: TextStyles.bold16.copyWith(
                                color: AppColors.primaryColor,
                              ),
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
        ),
      ],
    );
  }
}


