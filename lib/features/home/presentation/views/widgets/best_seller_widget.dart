import 'package:Bazaar/features/home/presentation/manger/wishList/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/available_widget.dart';
import '../../../../../core/widgets/sell_widget.dart';
import '../../../data/model/products_model.dart';

class BestSellerGridWidget extends StatefulWidget {
  final ProductsModel product;

  const BestSellerGridWidget({super.key, required this.product});

  @override
  State<BestSellerGridWidget> createState() => _BestSellerGridWidgetState();
}

class _BestSellerGridWidgetState extends State<BestSellerGridWidget> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * .60.w,
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
              height: 120.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(color: const Color(0xffF7F7FB)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SellWidget(product: widget.product),
                        IconButton(
                          splashColor: AppColors.transparent,
                          onPressed: () {
                            setState(() {
                              isFav = !isFav;
                            });
                            context.read<WishlistCubit>().toggleFavorite(
                              widget.product.sId ?? '',
                            );
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav
                                ? AppColors.primaryColor
                                : AppColors.primaryColor,
                            size: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.network(
                        widget.product.productImage?.first ?? '',
                        height: 120.h,
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
                  widget.product.name ?? '',
                  style: TextStyles.bold16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.product.category ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AvailableWidget(),
                      Row(
                        children: [
                          Text(
                            '${widget.product.price} L.E',
                            style: TextStyles.bold16.copyWith(
                              color: AppColors.black12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '${widget.product.discountedPrice} L.E',
                            style: TextStyles.bold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
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
