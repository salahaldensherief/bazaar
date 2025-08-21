// brands_widget_listview.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'brands_widget.dart';

class BrandsWidgetListView extends StatelessWidget {
  const BrandsWidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> img = [
      'assets/images/APC.png',
      'assets/images/Hikvision.png',
      'assets/images/Schneider.png',
      'assets/images/WD.png',
      'assets/images/APC.png',
      'assets/images/Hikvision.png',
      'assets/images/Schneider.png',
      'assets/images/WD.png',
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (context, index) {
          return BrandsWidget(imagePath: img[index]);
        },
      ),
    );
  }
}
