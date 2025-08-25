import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';

import '../../../../home/presentation/views/widgets/custom_search_bar.dart';

class SearchPageViewBody extends StatelessWidget {
  const SearchPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        centerTitle: false,
        title: 'Search for the product',
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
        SearchBarWidget(
          isEnabled: true,
        ),

      ],),

    );
  }
}
