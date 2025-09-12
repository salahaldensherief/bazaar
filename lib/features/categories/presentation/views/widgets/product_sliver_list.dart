import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/product_details_view.dart';
import '../../../../../core/widgets/products_view_list.dart';
import '../../../../home/data/model/products_model.dart';

class ProductsSliverList extends StatelessWidget {
  final List<ProductsModel> products;

  const ProductsSliverList({super.key, required this.products});

  String _getImageUrl(List<String>? images) {
    return (images != null && images.isNotEmpty) ? images.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = products[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
          child: ProductViewList(
            image: _getImageUrl(product.productImage),
            productName: product.name ?? '',
            productCategory: product.brand ?? '',
            productPrice:
                (product.discountPercentage ?? product.price)?.toDouble() ??
                0.0,
          ),
        );
      }, childCount: products.length),
    );
  }
}
