// brands_widget_listview.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/features/home/presentation/views/widgets/our_products_widget.dart';

class OurProductsListView extends StatelessWidget {
  const OurProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> img = [
      'assets/images/cam.png',
          'assets/images/ups-1.png',
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (context, index) {
          return OurProductsWidget(imagePath: img[index]);
        },
      ),
    );
  }
}
