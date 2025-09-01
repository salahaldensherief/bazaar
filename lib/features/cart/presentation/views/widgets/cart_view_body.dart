import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';
import 'package:mega_top/core/widgets/custom_button.dart';
import 'package:mega_top/features/cart/presentation/views/widgets/cart_view_items.dart';

import '../../../../../core/utils/text_styles.dart';

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
