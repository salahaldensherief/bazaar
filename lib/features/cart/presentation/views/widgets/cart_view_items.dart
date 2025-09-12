import 'package:Bazaar/features/cart/presentation/views/widgets/product_cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';

class CartViewItems extends StatelessWidget {
  const CartViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 64.h,
            color: AppColors.black5,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                children: [
                  SvgPicture.asset(AssetsData.map),
                  SizedBox(width: 8.w),
                  Text(
                    'Delivery to Egypt - section 2, Nasr City',
                    style: TextStyles.semiBold13,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Row(
              children: [
                Text('Your shipment', style: TextStyles.medium15),
                Spacer(),
                Text('2 Products'),
              ],
            ),
          ),
          ProductCartView(),

        ],
      ),
    );
  }
}
