import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';
import 'package:mega_top/core/widgets/sell_widget.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/products_sliver_grid.dart';
import 'package:mega_top/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'add_to_cart_container.dart';
import 'available_widget.dart';
import 'carousel_slider_widget.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final List<String> images = [AssetsData.ups, AssetsData.ups, AssetsData.ups];

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        BackgroundColor: AppColors.LigthGray,
        showElevation: false,
        showBack: true,
        centerTitle: false,
        title: 'Product name',
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
                      height: screenheight / 3.30,
                      decoration: const BoxDecoration(
                        color: AppColors.LigthGray,
                      ),
                    ),
                    CarouselSliderWidget(height: screenheight / 4),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(4.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AssetsData.fav,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(4.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AssetsData.compare,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UPS - version 1',
                                style: TextStyles.bold23.copyWith(
                                  color: AppColors.black,
                                  inherit: false,
                                ),
                              ),
                              Text(
                                'Storage units, hard disk',
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColors.black12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const AvailableWidget(),
                              SizedBox(width: 8.w),
                              // const SellWidget(
                              //
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '1500 LE',
                            style: TextStyles.bold23.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '2000 LE',
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
                        'This product is part of the Easy UPS collection. It features a total of 4 power outlets, all of which provide battery backup and surge protection. It has an interactive line topology. The UPS has a high power rating of 156 joules. Its dimensions are 9.25 x 16.05 x 30.5 cm and its weight is 5.7 kg. Easy UPS provides a simple power protection solution for unstable power conditions in homes and small offices, ensuring stable and reliable connectivity in the moments that matter most. UPS is a CE certified product.',
                        style: TextStyles.medium14.copyWith(
                          color: AppColors.black19,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'You may also like',
                        style: TextStyles.bold23.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: BestSellerListView()),
          SliverToBoxAdapter(child: SizedBox(height: 90.h)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color:AppColors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SizedBox(width: 343.w, child: AddToCartContainer()),
        ),
      ),
    );
  }
}
