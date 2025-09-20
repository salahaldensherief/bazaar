import 'package:Bazaar/features/home/data/model/products_model.dart';

class OrderModel {
  final String id;
  final PaymentDetails paymentDetails;
  final List<ProductsModel> productDetails;
  final String email;
  final String userId;
  final List<int> shippingOptions;
  final int totalAmount;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.paymentDetails,
    required this.productDetails,
    required this.email,
    required this.userId,
    required this.shippingOptions,
    required this.totalAmount,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      paymentDetails: PaymentDetails.fromJson(json['paymentDetails'] ?? {}),
      productDetails: (json['productDetails'] as List<dynamic>? ?? [])
          .map((item) => ProductsModel.fromJson(item))
          .toList(),
      email: json['email'] ?? '',
      userId: json['userId'] ?? '',
      shippingOptions: List<int>.from(json['shipping_options'] ?? []),
      totalAmount: json['totalAmount'] ?? 0,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}

class PaymentDetails {
  final String paymentId;
  final String paymentStatus;

  PaymentDetails({required this.paymentId, required this.paymentStatus});

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      paymentId: json['paymentId'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
    );
  }
}
