import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final slider.CarouselSliderController _carouselController =
      slider.CarouselSliderController();
  int _current = 0;

  final List<String> imgList = [
    'assets/images/example_heder.png',
    'assets/images/example_heder.png',
    'assets/images/example_heder.png',
    'assets/images/example_heder.png',
    'assets/images/example_heder.png',
    'assets/images/example_heder.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          slider.CarouselSlider(
            items: imgList
                .map(
                  (item) => Container(
                    margin: EdgeInsets.only(right: 8.w, left: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.r),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
                .toList(),
            carouselController: _carouselController,
            options: slider.CarouselOptions(
              height: 173.h,
              viewportFraction: 0.89,
              padEnds: false,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          SizedBox(height: 16.h),
          AnimatedSmoothIndicator(
            activeIndex: _current,
            count: imgList.length,
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                width: 40.w,
                height: 8.h,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              dotDecoration: DotDecoration(
                width: 8.w,
                height: 8.h,
                color: AppColors.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
