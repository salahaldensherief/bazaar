import 'package:Bazaar/core/utils/assets_images.dart';
import 'package:Bazaar/core/utils/text_styles.dart';
import 'package:Bazaar/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/presentation/views/widgets/bottom_nav_bar.dart';
import '../utils/app_colors.dart';

class OrderSuccessfullyWidget extends StatelessWidget {
  const OrderSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AssetsData.confirmOrder, width: 200.w)),
          SizedBox(height: 20.h),
          Text(
            'Your order received successfully',
            style: TextStyles.bold19,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            'Your order number is : #433463',
            style: TextStyles.bold16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
            },
            text: 'Continue Shopping',
            color: AppColors.whiteColor,
            colorSide: AppColors.primaryColor,
            fontColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
