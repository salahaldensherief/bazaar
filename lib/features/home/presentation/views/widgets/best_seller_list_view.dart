import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_seller_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 253.w,
      height: 330.h,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 2,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: BestSellerWidget(),
          );
        },
      ),
    );
  }
}
