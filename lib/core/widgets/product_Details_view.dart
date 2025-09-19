import 'package:Bazaar/features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'package:Bazaar/features/cart/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/auth/data/models/sign_in_model.dart';
import '../../features/cart/data/cart_item.dart';
import '../../features/cart/data/cart_response.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/categories/presentation/views/widgets/product_sliver_list.dart';
import '../../features/home/data/model/products_model.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/presentation/views/widgets/custom_carousel_slider.dart';
import '../services/getit/service_locator.dart';
import '../services/shared_preferences_singleton.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import 'add_to_cart_container.dart';
import 'available_widget.dart';
import 'carousel_slider_widget.dart';
import 'custom_app_bar.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductsModel product;
  User? user;

  ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final prod = product;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentUser = sl<User>();

    return BlocProvider(
      create: (context) => CartCubit(cart: sl<CartRepo>(), user: currentUser),
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          BackgroundColor: AppColors.LigthGray,
          showElevation: false,
          showBack: true,
          centerTitle: false,
          title: prod.name ?? "Product",
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: screenHeight / 3.30,
                        decoration: const BoxDecoration(
                          color: AppColors.LigthGray,
                        ),
                      ),
                      CarouselSliderWidget(
                        height: screenHeight / 4,
                        images: prod.productImage ?? [],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prod.name ?? '',
                          style: TextStyles.bold23.copyWith(
                            color: AppColors.black,
                            inherit: false,
                          ),
                        ),
                        Text(
                          prod.category ?? '',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.black12,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${prod.discountedPrice ?? prod.price} LE',
                              style: TextStyles.bold23.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            if (prod.discountedPrice != null)
                              Text(
                                '${prod.price} LE',
                                style: TextStyles.bold21.copyWith(
                                  color: AppColors.black12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'About the product',
                          style: TextStyles.bold23.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const Divider(color: AppColors.black10, thickness: 2),
                        Text(
                          prod.description ?? '',
                          style: TextStyles.medium14.copyWith(
                            color: AppColors.black19,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.transparent,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: SizedBox(
              width: 343.w,
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is CartFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is CartSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Product added successfully"),
                      ),
                    );
                  } else if (state is CartEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cart is empty")),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CartLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ],
                    );
                  }
                  return AddToCartContainer(

                    onTap: () {
                      if (prod.sId != null && prod.sId!.isNotEmpty) {
                        context.read<CartCubit>().addToCart(prod.sId!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Product not found")),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
