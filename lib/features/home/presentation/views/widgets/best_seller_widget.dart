import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/products_view_grid.dart';
import '../../../data/model/products_model.dart';
import '../../manger/wishList/wish_list_cubit.dart';

class BestSellerWidget extends StatelessWidget {
  final ProductsModel product;

  const BestSellerWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return ProductViewGrid(
      imageHeight: 120.h,
      width: screenWidth * .60.w,
      height: 312.h,
      product: product,
    );
  }
}
