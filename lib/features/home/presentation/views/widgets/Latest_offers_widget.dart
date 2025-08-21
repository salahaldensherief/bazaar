import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';

class LatestOffersWidget extends StatelessWidget {
  const LatestOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final double gridHeight =
        screenHeight * 0.28; // نفس الارتفاع للصورة والجريد

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsData.offer,
              width: screenWidth * 0.45,
              height: gridHeight,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: gridHeight,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.02,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: screenHeight * 0.015,
                  crossAxisSpacing: screenWidth * 0.02,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.22,
                    height: screenWidth * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.LigthGray,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              AssetsData.hard,
                              width: screenWidth * 0.1,
                              height: screenHeight * 0.06,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text('Storage units', style: TextStyles.semiBold10),
                          Text('Discount 15%', style: TextStyles.semiBold8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
