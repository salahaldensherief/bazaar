import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/products_view_grid.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductViewGrid(
              imageHeight: 80.h,
              width: MediaQuery.of(context).size.width*.45.w,
            height: 250,
            ),
          );
        },
        childCount: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 3 / 4,
      ),
    );
  }
}
