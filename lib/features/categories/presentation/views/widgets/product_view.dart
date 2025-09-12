import 'package:Bazaar/features/categories/presentation/views/widgets/product_sliver_list.dart';
import 'package:Bazaar/features/categories/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/getit/service_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/list_or_grid_widget.dart';
import '../../../../home/data/repos/home_repo.dart';
import '../../cubits/productsCategory/products_category_cubit.dart';

class ProductsView extends StatefulWidget {
  final String category;

  const ProductsView({super.key, required this.category});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCategoryCubit(sl<HomeRepo>())
        ..fetchProductsByCategory(widget.category),
      child: Scaffold(
        appBar: CustomAppBar(
          showCart: true,
          centerTitle: false,
          showBack: true,
          title: widget.category,
        ),
        body: BlocBuilder<ProductsCategoryCubit, ProductsCategoryState>(
          builder: (context, state) {
            if (state is ProductsCategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsCategorySuccess) {

              final products = state.products;
              debugPrint(products.toString());

              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 64.w,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        ' ',
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: ListOrGridWidget(
                        isGrid: isGrid,
                        onToggle: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                      ),
                    ),
                  ),
                  if (isGrid)
                    ProductsSliverGrid(products: products)
                  else
                    ProductsSliverList(products: products),
                ],
              );
            } else if (state is ProductsCategoryFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.w,
                      color: Colors.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.errMessage,
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),

                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}