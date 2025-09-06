import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';
import 'package:mega_top/core/widgets/products_view_grid.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  static const String routeName = 'search_view_body';
  final TextEditingController searchController = TextEditingController();

  SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
  final  screenWidth = MediaQuery.of(context).size.width;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: 'Search for the product',
        showBack: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Container(
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          context.read<SearchCubit>().searchProducts(value);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Here ...',
                        hintStyle: TextStyles.medium14.copyWith(
                          color: AppColors.black40,
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: SvgPicture.asset(
                            AssetsData.search,
                            width: 22.w,
                            height: 22.h,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(minHeight: 32.h),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 52.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: isRTL
                          ? BorderRadius.only(
                        topLeft: Radius.circular(4.r),
                        bottomLeft: Radius.circular(4.r),
                      )
                          : BorderRadius.only(
                        topRight: Radius.circular(4.r),
                        bottomRight: Radius.circular(4.r),
                      ),
                    ),
                    child: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      width: 30.w,
                      height: 30.h,
                      AssetsData.flter,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  if (state.products.isEmpty) {
                    return const Center(child: Text("No results found"));
                  }
                  return  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      childAspectRatio: 0.5,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductViewGrid(
                        width: screenWidth * .60.w,
                        height: 129.h,
                        imageHeight: 120.h,
                        image: product.productImage?.first ?? '',
                        productName: product.name ?? '',
                        productCategory: product.category ?? '',
                        productPrice: (product.discountedPrice ?? product.price ?? 0).toDouble(),
                      );
                    },
                  );
                } else if (state is SearchFailure) {
                  return Center(child: Text(state.errMessage));
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
