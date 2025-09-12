import 'package:Bazaar/features/home/data/model/products_model.dart';

class WishlistItem {
  final String? sId;
  final ProductsModel? product;
  final int? quantity;

  WishlistItem({this.sId, this.product, this.quantity});

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      sId: json['_id'],
      product: json['product'] != null
          ? ProductsModel.fromJson(json['product'])
          : null,
      quantity: json['quantity'],
    );
  }
}