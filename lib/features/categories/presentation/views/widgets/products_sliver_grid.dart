import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/products_view_grid.dart';
import '../../../../../core/widgets/product_details_view.dart';
import '../../../../home/data/model/products_model.dart';
import '../../../../home/presentation/manger/wishList/wish_list_cubit.dart';

class ProductsSliverGrid extends StatelessWidget {
  final List<ProductsModel> products;

  const ProductsSliverGrid({super.key, required this.products});

  String _getImageUrl(List<String>? images) {
    return (images != null && images.isNotEmpty) ? images.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          final productId = product.sId ?? '';

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailsView(product: product),
                ),
              );
            },

            child: ProductViewGrid(
              width: 163.w,
              height: 220.h,
              imageHeight: 140.h,
              image: _getImageUrl(product.productImage),
              productName: product.name ?? '',
              productCategory: product.brand ?? '',
              productPrice: (product.price)?.toDouble() ?? 0.0,
              onFavToggle: () {
                // context.read<WishlistCubit>().toggleFavorite(productId);
              },
              // isFav: context.read<WishlistCubit>().isFavorite(productId),
            ),
          );
        }, childCount: products.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.75,
        ),
      ),
    );
  }
}
