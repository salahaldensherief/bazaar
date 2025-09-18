import 'package:Bazaar/core/services/api/api_endpoint.dart';
import 'package:Bazaar/core/services/api/dio_consumer.dart';
import 'package:Bazaar/core/services/errors/error_model.dart';
import 'package:Bazaar/core/services/errors/exceptions.dart';
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
        return left(ServerException(errorModel: ErrorModel(message: "Invalid server response")));
      }
      final data = response["data"]["items"] as List;
      final items = data.map((e) => CartItem.fromJson(e)).toList();
      return right(items);
    } catch (e) {
      return left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }

  Future<Either<ServerException, List<CartItem>>> removeFromCart({required String cartItemId}) async {
    try {
      final response = await api.delete(ApiEndPoint.deleteCart, data: {"productId": cartItemId});
      if (response is! Map<String, dynamic>) {
        return left(ServerException(errorModel: ErrorModel(message: "Invalid server response")));
      }
      return getCartItems();
    } catch (e) {
      return left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }

  Future<Either<ServerException, List<CartItem>>> addToCart({required String productId}) async {
    try {
      final response = await api.post(ApiEndPoint.addToCart, data: {"productId": productId});
      if (response is! Map<String, dynamic>) {
        return left(ServerException(errorModel: ErrorModel(message: "Invalid server response")));
      }
      return getCartItems();
    } catch (e) {
      return left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }
}