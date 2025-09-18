import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/product_Details_view.dart';
import '../../../../../features/home/data/model/products_model.dart';
import '../../manger/products/products_cubit.dart';
import 'best_seller_widget.dart';

class BestSellerListView extends StatelessWidget {
  final int itemCount;
  final String category;

  const BestSellerListView({
    super.key,
    this.itemCount = 10,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductsSuccess) {
          final products = state.products;
          final filtered = products
              .where((p) => p.category?.toLowerCase() == category.toLowerCase())
              .toList();
          final limitedProducts = filtered.take(itemCount).toList();

          if (limitedProducts.isEmpty) {
            return Center(child: Text(" No products found for $category"));
          }

          return SizedBox(
            width: 253.w,
            height: 330.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: limitedProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0.w,
                    vertical: 8.h,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(

                            product: limitedProducts[index],
                          ),
                        ),
                      );
                    },
                    child: BestSellerGridWidget(
                      product: limitedProducts[index],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
