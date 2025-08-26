import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/products_view_grid.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ProductViewGrid(
      imageHeight: 120.h,
      width: screenWidth*.65.w,
      height: 312.h,
    );
  }
}
