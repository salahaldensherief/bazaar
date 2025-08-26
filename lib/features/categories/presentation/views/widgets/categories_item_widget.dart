import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/product_view.dart';

import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/text_styles.dart';

class CategoriesItemWidget extends StatelessWidget {
  const CategoriesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductsView();
        },));

      },
      child: Container(
        decoration: BoxDecoration(
          color:AppColors.backIconColor ,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 1,
              offset: const Offset(0,0),
            ),
          ],
        ),
        padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(AssetsData.hard, fit: BoxFit.contain),
            ),
             SizedBox(height: 8.h),
            Text(
              'Storage',
              style: TextStyles.semiBold14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
