import 'package:Bazaar/core/widgets/checkout_botton.dart';
import 'package:Bazaar/core/widgets/widget_empty.dart';
import 'package:Bazaar/features/cart/presentation/views/widgets/payment_method_view.dart';
import 'package:Bazaar/features/cart/presentation/views/widgets/product_cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubits/cart/cart_cubit.dart';

class CartViewItems extends StatelessWidget {
  const CartViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess && state.cartItems.isNotEmpty) {
                return CheckoutBotton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<CartCubit>(),
                          child: PaymentMethodView(),
                        ),
                      ),
                    );
                  },
                  productCount: '${state.cartItems.length}',
                  totalPrice: state.total.toStringAsFixed(2),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 64.h,
              color: AppColors.black5,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsData.map),
                    SizedBox(width: 8.w),
                    Text(
                      'Delivery to Egypt - section 2, Nasr City',
                      style: TextStyles.semiBold13,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Row(
                children: [
                  Text('Your shipment', style: TextStyles.medium15),
                  Spacer(),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      int count = 0;
                      if (state is CartSuccess) {
                        count = state.cartItems.length;
                      }
                      return Text('$count Products');
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CartFailure || state is CartEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: WidgetEmpty(
                        imagePath: AssetsData.cartEmpty,
                        title: 'Your shopping cart is empty',
                        subtitle:
                        'Browse our products and add the products you want to buy to the shopping cart by clicking the add button.',
                      ),
                    ),
                  );
                } else if (state is CartSuccess) {
                  return Column(
                    children: state.cartItems
                        .map((cartItem) => ProductCartView(cartItem))
                        .toList(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
