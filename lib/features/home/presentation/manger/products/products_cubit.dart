import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';

import '../../../data/model/wishlist_response.dart';
import '../../../data/repos/home_repo.dart';
import '../wishList/wish_list_state.dart';

part 'products_state.dart';
class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;

  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  Future<void> getProducts({String? category}) async {
    emit(ProductsLoading());

    final result = await homeRepo.fetchProducts();

    result.fold(
          (error) => emit(ProductsFailure(errorMessage: error.errorModel.message)),
          (products) {
        List<ProductsModel> filteredProducts = products;

        if (category != null) {
          filteredProducts =
              products.where((p) => p.category == category).toList();
        }

        emit(ProductsSuccess(products: filteredProducts));
      },
    );
  }
}

