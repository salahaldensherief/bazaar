import 'package:Bazaar/features/home/data/model/products_model.dart';

class CartItem {
  final String id;
  final ProductsModel product;
  final int quantity;

  CartItem({required this.id, required this.product, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["_id"],
    product: ProductsModel.fromJson(json["product"]),
    quantity: json["quantity"],
  );
}
