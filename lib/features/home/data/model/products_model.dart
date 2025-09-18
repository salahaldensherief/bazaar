import 'package:hive/hive.dart';
part 'products_model.g.dart';
@HiveType(typeId: 0)
class ProductsModel {
  @HiveField(0)
  String? sId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? brand;
  @HiveField(3)
  int? price;
  @HiveField(4)
  String? discount;
  @HiveField(5)
  int? quantity;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String? category;
  @HiveField(8)
  List<String>? productImage;
  @HiveField(9)
  String? createdAt;
  @HiveField(10)
  String? updatedAt;
  @HiveField(11)
  int? iV;
  @HiveField(12)

  ProductsModel({
    this.sId,
    this.name,
    this.brand,
    this.price,
    this.discount,
    this.quantity,
    this.description,

    this.category,
    this.productImage,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'] ?? json;
    sId = json['_id'];
    name = json['name'];
    brand = json['brand'];
    price = json['price'];
    discount = json['discount'];
    quantity = json['quantity'];
    description = json['description'];
    category = productJson['category']?.toString() ?? '';
    productImage = (productJson['product_image'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList() ?? [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['brand'] = brand;
    data['price'] = price;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['description'] = description;
    data['category'] = category;
    data['product_image'] = productImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  int get discountedPrice {
    if (discount == null) return price ?? 0;
    return int.tryParse(discount!) ?? price ?? 0;
  }

  int get discountPercentage {
    if (price == null || discount == null) return 0;
    final discounted = int.tryParse(discount!) ?? price!;
    return (((price! - discounted) / price!) * 100).round();
  }
}
