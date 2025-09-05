import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String image;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.h,
                decoration: BoxDecoration(
                  color: Color(0xffE8EDF2),

                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(160),
                    bottomLeft: Radius.circular(160),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 50,
                child: Image.asset(image, width: 180.w, height: 180.h),
              ),
            ],
          ),
          SizedBox(height: screenHeight * .050),
          Expanded(child: Text(textAlign: TextAlign.center, title, style: TextStyles.bold23)),
          SizedBox(height: screenHeight * .01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.medium14.copyWith(color: Color(0xff808080)),
            ),
          ),
        ],
      ),
    );
  }
}
