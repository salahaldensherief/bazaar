import 'package:dartz/dartz.dart';

import '../../../../core/services/errors/exceptions.dart';
import '../../../cart/data/cart_response.dart';
import '../model/products_model.dart';
import '../model/wishlist_response.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<ProductsModel>>> fetchProducts({
    String? category,
  });
  Future<Either<ServerException, List<ProductsModel>>> searchProducts({
    String? query,
  });
  Future<Either<ServerException, List<ProductsModel>>> addProductToWishlist({
    String? id,
  });
  Future<Either<ServerException, List<ProductsModel>>> fetchWishlist();
  Future<Either<ServerException, List<ProductsModel>>> fetchCategories();
  Future<Either<ServerException, List<ProductsModel>>> fetchProductsByCategory({
    required String category,
  });
}
