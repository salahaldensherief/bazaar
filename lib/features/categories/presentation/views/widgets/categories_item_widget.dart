import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/app_colors.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/core/utils/text_styles.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/product_view.dart';

class CategoriesItemWidget extends StatelessWidget {
  const CategoriesItemWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final List<String> image;

  String _getImageUrl() {
    return (image.isNotEmpty) ? image.first : AssetsData.ups;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductsView(category: title),
          ),
        );
      },
      child: Card(

        elevation: 0.3,
        color: AppColors.backIconColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48.h,
              child: Image.network(
                _getImageUrl(),
                width: 48.w,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AssetsData.ups,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                title,
                style: TextStyles.semiBold14.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
