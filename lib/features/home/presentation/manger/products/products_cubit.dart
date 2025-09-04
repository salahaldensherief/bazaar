import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';

import '../../../data/repos/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;

  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());

    final result = await homeRepo.fetchBestSeller();

    result.fold(
          (error) => emit(ProductsFailure(errorMessage: error.errorModel.message)),
          (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
