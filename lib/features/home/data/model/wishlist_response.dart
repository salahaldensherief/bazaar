import 'package:mega_top/features/home/data/model/wishlist_item.dart';

class WishlistResponse {
  final String? sId;
  final String? userId;
  final List<WishlistItem> items;
  final String? createdAt;
  final String? updatedAt;

  WishlistResponse({
    this.sId,
    this.userId,
    this.items = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return WishlistResponse(
      sId: data['_id'],
      userId: data['user'],
      items: (data['items'] as List<dynamic>? ?? [])
          .map((e) => WishlistItem.fromJson(e))
          .toList(),
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}