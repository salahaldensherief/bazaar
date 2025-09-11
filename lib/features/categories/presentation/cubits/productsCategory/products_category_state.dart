part of 'products_category_cubit.dart';

@immutable
sealed class ProductsCategoryState {}

final class ProductsCategoryInitial extends ProductsCategoryState {}

final class ProductsCategoryLoading extends ProductsCategoryState {}

final class ProductsCategorySuccess extends ProductsCategoryState {
  final List<ProductsModel> products;

  ProductsCategorySuccess({required this.products});
}

final class ProductsCategoryFailure extends ProductsCategoryState {
  final String errMessage;

  ProductsCategoryFailure({required this.errMessage});
}
