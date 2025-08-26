import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/products_view_list.dart';

class ProductsSliverList extends StatelessWidget {
  const ProductsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: ProductViewList(),
          );
        },
        childCount: 30,

      ),
    );
  }
}
