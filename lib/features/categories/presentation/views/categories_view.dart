import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top/features/categories/presentation/views/widgets/categories_view_body.dart';

import '../../../../core/services/getit/service_locator.dart';
import '../../../home/data/repos/home_repo.dart';
import '../cubits/category/categories_cubit.dart';
import '../cubits/productsCategory/products_category_cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static const routeName = 'categoriesview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(homeRepo: sl<HomeRepo>())..fetchCategories(),
      child: CategoriesViewBody(),
    );
  }
}
