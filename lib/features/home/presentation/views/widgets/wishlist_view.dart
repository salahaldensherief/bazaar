import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/getit/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/products_view_grid.dart';
import '../../../../../core/widgets/products_view_list.dart';
import '../../../../../core/widgets/widget_empty.dart';
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
            } else if (state is wishState.WishlistError) {
              return WidgetEmpty(
                imagePath: AssetsData.fover,
                title: 'No wish list items',
                subtitle:
                    'Browse our products and add the products you like to your favorite products list by clicking on the heart sign.',
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
                      image: product.product?.productImage?.first ?? '',
                      productCategory: product.product?.category ?? '',
                      productName: product.product?.name ?? '',
                      productPrice: product.product!.discountedPrice.toDouble(),
                      productId: product.sId ?? '',

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
