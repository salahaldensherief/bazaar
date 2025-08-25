import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_item_widget.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 16.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 90,
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        childAspectRatio: .8,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 104.h,
          width: 104,
          child: CategoriesItemWidget(),
        );
      },
    );
  }
}
