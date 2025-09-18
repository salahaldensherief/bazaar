import 'package:Bazaar/features/cart/data/cart_item.dart';

class CartResponse {
  final String? sId;
  final String? userId;
  final List<CartItem> items;
  final String? createdAt;
  final String? updatedAt;

  CartResponse({
    this.sId,
    this.userId,
    this.items = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data']?? {};

    return CartResponse(
      sId: data['_id'],
      userId: data['user'],
      items: (data['items'] as List<dynamic>? ?? [])
          .map((e) => CartItem.fromJson(e))
          .toList(),
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}
