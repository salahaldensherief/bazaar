import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/text_styles.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({super.key, required this.category});
 final String category;
  @override
  Widget build(BuildContext context) {
    return  Text(
      category,
      style: TextStyles.medium15,
    );
  }
}
