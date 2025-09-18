import 'package:Bazaar/core/services/errors/exceptions.dart';
import 'package:Bazaar/features/cart/data/cart_item.dart';
import 'package:Bazaar/features/home/data/model/products_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<ServerException,List<CartItem>>>addToCart({required String productId});
  Future<Either<ServerException,List<CartItem>>>getCartItems();
  Future<Either<ServerException,List<CartItem>>>removeFromCart({ required String cartItemId});
}