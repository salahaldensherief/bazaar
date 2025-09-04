import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/services/api/dio_consumer.dart';
import 'package:mega_top/features/home/presentation/views/widgets/best_seller_section.dart';
import 'package:mega_top/features/home/presentation/views/widgets/brands_widget_list_view.dart';

import '../../manger/products/products_cubit.dart';
import 'Latest_offers_widget.dart';
import 'best_seller_list_view.dart';
import 'custom_carousel_slider.dart';
import 'custom_search_bar.dart';
import 'icons_app_bar.dart';
import 'our_products_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,

        slivers: [
          SliverToBoxAdapter(
            child: IconAppBar(
              subTitle: 'Welcome !',
              showHeart: true,
              solidBell: true,
              radius: 25.r,
            ),
          ),
          SliverToBoxAdapter(child: SearchBarWidget(isEnabled: false)),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: SizedBox(height: 220.h, child: CustomCarouselSlider()),
          ),

          SliverToBoxAdapter(child: SectionWidget(title: 'Brands')),
          SliverToBoxAdapter(child: BrandsWidgetListView()),
          SliverToBoxAdapter(child: SectionWidget(title: 'Our products')),
          SliverToBoxAdapter(child: OurProductsListView()),
          SliverToBoxAdapter(child: SectionWidget(title: 'Best Seller')),
          SliverToBoxAdapter(child: BestSellerListView()),
          SliverToBoxAdapter(child: SectionWidget(title: 'Latest offers')),
          SliverToBoxAdapter(child: LatestOffersWidget()),
          SliverToBoxAdapter(child: SectionWidget(title: 'Latest products')),
          SliverToBoxAdapter(child: BestSellerListView()),
        ],
      ),
    );
  }
}
