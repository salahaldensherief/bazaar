import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/features/home/presentation/views/widgets/best_seller_section.dart';
import 'package:mega_top/features/home/presentation/views/widgets/brands_widget_list_view.dart';

import 'brands_widget.dart';
import 'custom_carousel_slider.dart';
import 'custom_search_bar.dart';
import 'icons_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: IconAppBar()),
          SliverToBoxAdapter(child: SearchBarWidget()),
          SliverToBoxAdapter(
            child: SizedBox(height: 220.h, child: CustomCarouselSlider()),
          ),

          SliverToBoxAdapter(child: SectionWidget(title: 'Brands')),
          SliverToBoxAdapter(child: BrandsWidgetListView()),
        ],
      ),
    );
  }
}
