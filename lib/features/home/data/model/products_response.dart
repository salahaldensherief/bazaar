import 'package:mega_top/features/home/data/model/products_model.dart';

class ProductsResponse {
  final List<ProductsModel> data;

  ProductsResponse({required this.data});
  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      data: (json['data'] as List)
          .map((data) => ProductsModel.fromJson(data))
          .toList(),
    );
  }
}
