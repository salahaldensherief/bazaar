class ProductsModel {
  String? sId;
  String? name;
  String? brand;
  int? price;
  String? discount;
  int? quantity;
  String? description;
  String? category;
  List<String>? productImage;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
