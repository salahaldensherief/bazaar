import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';
import 'package:mega_top/core/widgets/sell_widget.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/products_sliver_grid.dart';
import 'package:mega_top/features/home/presentation/manger/products/products_cubit.dart';
import 'package:mega_top/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/categories/presentation/views/widgets/product_sliver_list.dart';
import '../../features/home/data/model/products_model.dart';
import '../../features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'add_to_cart_container.dart';
import 'available_widget.dart';
import 'carousel_slider_widget.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final prod = product;

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                        'Abouِt the product',
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
          SliverToBoxAdapter(child: SizedBox(height: 80.h,),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SizedBox(width: 343.w, child: AddToCartContainer()),
        ),
      ),
    );
  }
}
