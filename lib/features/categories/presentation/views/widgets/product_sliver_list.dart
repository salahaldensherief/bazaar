import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/products_view_list.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';

import '../../../../../core/widgets/product_Details_view.dart';

class ProductsSliverList extends StatelessWidget {
   ProductsSliverList({super.key});
late ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductDetailsView(product:productsModel ,)),
              );
            },
            child: ProductViewList(),
          ),
        );
      }, childCount: 30),
    );
  }
}
