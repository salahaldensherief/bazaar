import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'brands_widget.dart';

class BrandsWidgetListView extends StatelessWidget {
  const BrandsWidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> img = [
      'assets/images/apple-13.svg',
      'assets/images/dell-3.svg',
      'assets/images/lg-electronics.svg',
      'assets/images/samsung-electronics.svg',
      'assets/images/xiaomi-3.svg',
    ];

    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (context, index) {
          return BrandsWidget(imagePath: img[index]);
        },
      ),
    );
  }
}
