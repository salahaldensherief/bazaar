import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/product_sliver_list.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/products_sliver_grid.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/products_view_grid.dart';
import '../../../../../core/widgets/products_view_list.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showCart: true,
        centerTitle: false,
        showBack: true,
        title: 'Product name',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.black5,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isGrid ? Icons.list : Icons.grid_view,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          isGrid ? 'List' : 'Grid',
                          style: TextStyles.medium15.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 52.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.black5,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AssetsData.sort),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 52.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.black5,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AssetsData.flterblack),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isGrid)
            const ProductsSliverGrid()
          else
            const ProductsSliverList(),
        ],
      ),
    );
  }
}
