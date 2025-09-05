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
  final dynamic  product;

  const ProductViewGrid({
    super.key,
    required this.width,
    required this.height,
    required this.imageHeight,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SellWidget(product: product),
                            IconButton(
                              splashColor: AppColors.transparent,
                              onPressed: () {
                                // if (isFav) {
                                //   context.read<WishlistCubit>().removeFromWishlist(product.sId!);
                                // } else {
                                //   context.read<WishlistCubit>().addToWishlist(product.sId!);
                                // }
                              },
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
                            product.productImage?.first ?? '',
                            height: imageHeight,
                            fit: BoxFit.fitHeight,
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
                      product.name ?? '',
                      style: TextStyles.bold16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.category ?? '',
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
                            '${product.discountedPrice ?? product.price} L.E',
                            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
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
