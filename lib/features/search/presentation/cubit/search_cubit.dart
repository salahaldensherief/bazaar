import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/errors/error_model.dart';
import '../../../../core/services/errors/exceptions.dart';
import '../../../home/data/model/products_model.dart';
import '../../../home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit({required this.homeRepo}) : super(SearchInitial());

  Future<void> searchProducts(String query) async {
    emit(SearchLoading());

    final result = await homeRepo.searchProducts(query:query);

    result.fold(
      (failure) => emit(SearchFailure(errMessage: failure.errorModel.message)),
      (products) => emit(SearchSuccess(products)),
    );
  }
}
