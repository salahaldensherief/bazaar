import 'package:mega_top/features/home/data/model/products_model.dart';

class WishlistItem {
  final String? id;
  final ProductsModel? product;
  final int? quantity;

  WishlistItem({this.id, this.product, this.quantity});

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['_id'],
      product: json['product'] != null
          ? ProductsModel.fromJson(json['product'])
          : null,
      quantity: json['quantity'],
    );
  }
}