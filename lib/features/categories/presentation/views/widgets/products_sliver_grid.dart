import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/product_Details_view.dart';
import '../../../../../core/widgets/products_view_grid.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProductDetailsView(),));
            },
            child: ProductViewGrid(
              imageHeight: 64.h,
              width: MediaQuery.of(context).size.width * .42.w,
              height: 228,
            ),
          ),
        );
      }, childCount: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: .1,
        mainAxisSpacing: 2,
        childAspectRatio: 3 / 3.5,
      ),
    );
  }
}
