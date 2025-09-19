import 'package:Bazaar/core/services/api/api_endpoint.dart';
import 'package:Bazaar/core/services/api/dio_consumer.dart';
import 'package:Bazaar/core/services/errors/error_model.dart';
import 'package:Bazaar/core/services/errors/exceptions.dart';
import 'package:Bazaar/features/auth/data/models/sign_in_model.dart';
import 'package:Bazaar/features/cart/data/cart_item.dart';
import 'package:Bazaar/features/cart/data/cart_response.dart';
import 'package:Bazaar/features/cart/data/repos/cart_repo.dart';
import 'package:Bazaar/features/home/data/model/products_model.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl implements CartRepo {
  final DioConsumer api;

  CartRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<CartItem>>> getCartItems() async {
    try {
      final response = await api.get(ApiEndPoint.getCart);

      if (response is! Map<String, dynamic>) {
        return left(
          ServerException(
            errorModel: ErrorModel(message: "Invalid server response"),
          ),
        );
      }
      print("Cart Response: $response");
      final data = (response["data"]?["items"] ?? []) as List;
      final items = data.map((e) => CartItem.fromJson(e)).toList();

      return right(items);
    } catch (e) {
      return left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  Future<Either<ServerException, List<CartItem>>> removeFromCart({
    required String cartItemId,
  }) async {
    try {
      final response = await api.delete(
        ApiEndPoint.deleteCart,
        data: {"productId": cartItemId},
      );
      if (response is! Map<String, dynamic>) {
        return left(
          ServerException(
            errorModel: ErrorModel(message: "Invalid server response"),
          ),
        );
      }
      return getCartItems();
    } catch (e) {
      return left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  Future<Either<ServerException, List<CartItem>>> addToCart({
    required String productId,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoint.addToCart,
        data: {"productId": productId},
      );
      if (response is! Map<String, dynamic>) {
        return left(
          ServerException(
            errorModel: ErrorModel(message: "Invalid server response"),
          ),
        );
      }
      return getCartItems();
    } catch (e) {
      return left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, bool>> checkout({
    required User user,
    required List<CartItem> items,
  }) async {
    try {
      final body = {
        "data": {
          "_id": user.id,
          "user": user.id,
          "items": items.map((item) {
            if (item.product.sId != null) {
              return {
                "_id": item.id,
                "quantity": item.quantity,
                "product": {
                  "_id": item.product.sId,
                  "name": item.product.name,
                  "brand": item.product.brand,
                  "price": item.product.price,
                  "discount": item.product.discount ?? "0",
                  "quantity": item.product.quantity ?? 1,
                  "description": item.product.description,
                  "category": item.product.category,
                  "product_image": item.product.productImage ?? [],
                  "createdAt": item.product.createdAt,
                  "updatedAt": item.product.updatedAt,
                  "__v": item.product.iV,
                },
              };
            } else {
              return {
                "_id": item.id,
                "quantity": item.quantity,
                "product": item.product.sId,
              };
            }
          }).toList(),
        },
      };

      final response = await api.post(ApiEndPoint.checkout, data: body);
      if (response['success'] == true) {
        return right(true);
      } else {
        return left(
          ServerException(
            errorModel: ErrorModel(
              message: response['message'] ?? "Checkout failed",
            ),
          ),
        );
      }
    } catch (e) {
      return left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }
}
