import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/widgets/custom_button.dart';

import '../../../../../core/services/getit/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/products_view_grid.dart';
import '../../../../../core/widgets/products_view_list.dart';
import '../../../data/repos/home_repo.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../manger/wishList/wish_list_cubit.dart';
import '../../manger/wishList/wish_list_state.dart' as wishState;
import 'bottom_nav_bar.dart';

class WishlistView extends StatelessWidget {
  final HomeRepo homeRepo;
  final String? productId;

  const WishlistView({super.key, required this.homeRepo, this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WishlistCubit>()..fetchWishlist(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Wish list', showBack: true),
        body: BlocBuilder<WishlistCubit, wishState.WishlistState>(
          builder: (context, state) {
            if (state is wishState.WishlistLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is wishState.WishlistEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsData.fover, height: 150.h),
                  SizedBox(height: 16.h),
                  Text(
                    'No wish list items',
                    textAlign: TextAlign.center,
                    style: TextStyles.bold22.copyWith(color: AppColors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Browse our products and add the products you like to your favorite products list by clicking on the heart sign.',
                      textAlign: TextAlign.center,
                      style: TextStyles.medium14.copyWith(
                        color: AppColors.black12,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        BottomNavBar.routeName,
                      );
                    },
                    text: 'Continue Shopping',
                    color: AppColors.whiteColor,
                    colorSide: AppColors.primaryColor,
                    fontColor: AppColors.primaryColor,
                  ),
                ],
              );
            } else if (state is wishState.WishlistSuccess) {
              final wishlist = state.wishlist;

              return ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final product = wishlist[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: ProductViewList(
                      image: product.productImage?.first ?? '',
                      productCategory: product.category ?? '',
                      productName: product.name ?? '',
                      productPrice: product.discountedPrice.toDouble(),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
