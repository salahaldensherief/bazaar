import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/model/products_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.homeRepo}) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchCategories({String? category}) async {
    emit(CategoriesLoading());
    final result = await homeRepo.fetchCategories();
    result.fold(
          (error) => emit(CategoriesFailure(errMessage: error.errorModel.message)),
          (products) {
        emit(CategoriesSuccess(categories: products));
      },
    );
  }
}
