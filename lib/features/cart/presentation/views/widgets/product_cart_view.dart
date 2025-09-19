import 'package:Bazaar/core/utils/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../home/data/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/cart_item.dart';
import '../../cubits/cart/cart_cubit.dart';

class ProductCartView extends StatelessWidget {
  final CartItem cartItem;
  const ProductCartView(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
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
              child: Image.network(
                cartItem.product.productImage?.first ?? '',
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      cartItem.product.category ?? '',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Spacer(),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        int quantity = cartItem.quantity;
                        if (state is CartSuccess) {
                          final updatedItem = state.cartItems.firstWhere(
                                  (e) => e.id == cartItem.id,
                              orElse: () => cartItem);
                          quantity = updatedItem.quantity;
                        }
                        final totalPrice =
                            (cartItem.product.discountedPrice) * quantity;

                        return Row(
                          children: [
                            Text(
                              '$totalPrice L.E',
                              style: TextStyles.medium15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CartCubit>()
                                    .updateQuantity(cartItem.id, quantity + 1);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: AppColors.backIconColor,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: SvgPicture.asset(AssetsData.plus),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(quantity.toString()),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) {
                                  context.read<CartCubit>().updateQuantity(
                                      cartItem.id, quantity - 1);
                                } else {
                                  context
                                      .read<CartCubit>()
                                      .removeFromCart(cartItem.id);
                                }
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
                                  quantity > 1
                                      ? AssetsData.minus
                                      : AssetsData.remove,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

