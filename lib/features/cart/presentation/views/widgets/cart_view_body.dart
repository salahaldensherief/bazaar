import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'cart_view_items.dart';

class CartViewBody extends StatelessWidget {
  CartViewBody({super.key});
  final List<Widget> widgets = [Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shopping Cart'),
      body: widgets.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      AssetsData.cartEmpty,
                      width: 152.w,
                      height: 152.h,
                    ),
                  ),
                  Text(
                    'Your shopping cart is empty',
                    style: TextStyles.medium15.copyWith(),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Browse our products and add the products you want to buy to the shopping cart by clicking the add button.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            )
          : CartViewItems(),
    );
  }
}
