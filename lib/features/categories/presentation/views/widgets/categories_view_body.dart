import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/custom_app_bar.dart';

import 'categories_grid_view.dart';
import 'categories_item_widget.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showCart: true, title: 'Categories'),
      body: CategoriesGridView(),
    );
  }
}

