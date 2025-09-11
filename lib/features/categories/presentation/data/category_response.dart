import '../../../home/data/model/products_model.dart';

class CategoryResponse {
  final List<ProductsModel> products;

  CategoryResponse({required this.products});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List? ?? [];
    final products = dataList.map((e) => ProductsModel.fromJson(e)).toList();
    return CategoryResponse(products: products);
  }
}