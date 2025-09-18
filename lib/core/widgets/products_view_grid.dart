import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/manger/wishList/wish_list_cubit.dart';
import '../../features/home/presentation/manger/wishList/wish_list_state.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/available_widget.dart';
import '../widgets/sell_widget.dart';
import '../../features/home/data/model/products_model.dart';

class ProductViewGrid extends StatelessWidget {
  final double width;
  final double height;
  final double imageHeight;
  final String image;
  final String productName;
  final String productCategory;
  final double productPrice;
  final bool isFav;
  final VoidCallback? onFavToggle;

  const ProductViewGrid({
    super.key,
    required this.width,
    required this.height,
    required this.imageHeight,
    required this.image,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    this.isFav = false,
    this.onFavToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(color: const Color(0xffF7F7FB)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          splashColor: AppColors.transparent,
                          onPressed: onFavToggle,
                          icon: Icon(
                            Icons.favorite_border,
                            color: AppColors.primaryColor,
                            size: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.network(
                        image,
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
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
              children: [
                Text(
                  productName ?? '',
                  style: TextStyles.bold16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  productCategory ?? '',
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
                        '${productPrice} L.E',
                        //discountedPrice ?? product.price} L.E',
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
    );
  }
}
