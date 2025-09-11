import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/model/products_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'products_category_state.dart';

class ProductsCategoryCubit extends Cubit<ProductsCategoryState> {
  ProductsCategoryCubit(this.homeRepo) : super(ProductsCategoryInitial());
  final HomeRepo homeRepo;
  Future<void> fetchProductsByCategory(String category) async {
    emit(ProductsCategoryLoading());
    final result = await homeRepo.fetchProductsByCategory(category: category);

    result.fold(
          (error) => emit(ProductsCategoryFailure(errMessage: error.errorModel.message)),
          (products) => emit(ProductsCategorySuccess(products: products)),
    );
  }
}
