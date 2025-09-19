import 'package:Bazaar/core/services/errors/exceptions.dart';
import 'package:Bazaar/features/cart/data/cart_item.dart';
import 'package:Bazaar/features/home/data/model/products_model.dart';
import 'package:dartz/dartz.dart';

import '../../../auth/data/models/sign_in_model.dart';

abstract class CartRepo {
  Future<Either<ServerException, List<CartItem>>> addToCart({
    required String productId,
  });
  Future<Either<ServerException, List<CartItem>>> getCartItems();
  Future<Either<ServerException, List<CartItem>>> removeFromCart({
    required String cartItemId,
  });
  Future<Either<ServerException, bool>> checkout({
    required User user,
    required List<CartItem> items,
  });
}
