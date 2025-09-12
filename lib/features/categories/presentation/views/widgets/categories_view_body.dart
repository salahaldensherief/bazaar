import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/getit/service_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../home/data/repos/home_repo.dart';
import '../../cubits/category/categories_cubit.dart';
import 'categories_grid_view.dart';
import 'categories_item_widget.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showCart: true, title: 'Categories'),
      body:  CategoriesGridView(),
    );
  }
}
