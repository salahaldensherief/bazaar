import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/app_colors.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
    required this.height,
    required this.images,
  });
  final double height;
  final List<String> images;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final slider.CarouselSliderController _carouselController =
      slider.CarouselSliderController();
  int _current = 0;

  _CarouselSliderWidgetState();

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    return Column(
      children: [
        slider.CarouselSlider(
          items: images
              .map(
                (item) => Container(
                  height: 120.h,
                  width: 141.94285583496094.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(item)),
                  ),
                ),
              )
              .toList(),
          carouselController: _carouselController,
          options: slider.CarouselOptions(
            height: 225.h,
            enlargeCenterPage: false,
            viewportFraction: 1,
            padEnds: false,
            autoPlay: false,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: images.length,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 40.w,
              height: 5.h,
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            dotDecoration: DotDecoration(
              width: 40.w,
              height: 5.h,
              color: AppColors.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
