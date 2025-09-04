import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../features/home/data/model/products_model.dart';
import '../../manger/products/products_cubit.dart';
import 'best_seller_widget.dart';

class BestSellerListView extends StatelessWidget {
  final int itemCount;

  const BestSellerListView({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductsSuccess) {
          final products = List<ProductsModel>.from(state.products);
          products.shuffle();
          final limitedProducts = products.take(itemCount).toList();
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
                  child: BestSellerWidget(product: limitedProducts[index]),
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
