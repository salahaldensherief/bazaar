import 'package:Bazaar/core/widgets/add_to_cart_container.dart';
import 'package:Bazaar/core/widgets/custom_button.dart';
import 'package:Bazaar/core/widgets/order_successfully_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Bazaar/core/utils/app_colors.dart';
import 'package:Bazaar/core/utils/text_styles.dart';
import 'package:Bazaar/core/widgets/custom_app_bar.dart';
import 'package:Bazaar/core/widgets/products_view_list.dart';
import 'package:Bazaar/features/cart/presentation/cubits/cart/cart_cubit.dart';
import 'package:Bazaar/features/cart/presentation/views/widgets/payment_container_details_widget.dart';
import '../../../../../core/utils/assets_images.dart';

class OrderSummaryView extends StatelessWidget {
  static const routeName = 'order-summary';
  const OrderSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBack: true, title: 'Order Summary'),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailure) {
            return Center(child: Text(state.message));
          } else if (state is CartEmpty) {
            return const Center(child: Text('Your cart is empty'));
          } else if (state is CartSuccess) {
            final cartItems = state.cartItems;
            final totalAmount = state.total;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Details
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black10),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order details',
                            style: TextStyles.medium15.copyWith(
                              color: AppColors.black19,
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Number of products (${cartItems.length})',
                                style: TextStyles.medium15.copyWith(
                                  color: AppColors.black19,
                                ),
                              ),
                              Text(
                                '\$${totalAmount.toStringAsFixed(2)}',
                                style: TextStyles.medium15.copyWith(
                                  color: AppColors.black19,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: TextStyles.medium15),
                              Text(
                                '\$${totalAmount.toStringAsFixed(2)}',
                                style: TextStyles.medium15.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Payment Method
                  PaymentContainerDetailsWidget(
                    title: 'Payment method',
                    widget: Row(
                      children: [
                        Image.asset(AssetsData.cash, width: 50.w, height: 25.h),
                        SizedBox(height: 8.h),
                        Text(
                          'Cash On Delivery',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Products List
                  PaymentContainerDetailsWidget(
                    title: 'Your order (${cartItems.length} products)',
                    widget: SizedBox(
                      height: (cartItems.length * 150).h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final product = cartItems[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: ProductViewList(
                              showFavIcon: false,
                              image: product.product.productImage?.first ?? '',
                              productCategory: product.product.category ?? '',
                              productId: product.product.sId ?? '',
                              productName: product.product.name ?? '',
                              productPrice: product.product.discountedPrice
                                  .toDouble(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AddToCartContainer(
                      title: 'Confirm Order',
                      icon: '',
                      onTap: () {
                        Navigator.push(context, CupertinoDialogRoute(builder: (context) => OrderSuccessfullyWidget(), context: context));
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
