import 'package:dartz/dartz.dart';

import '../../../../core/services/api/api_endpoint.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/errors/error_model.dart';
import '../../../../core/services/errors/exceptions.dart';
import '../../../cart/data/cart_response.dart';
import '../../../categories/presentation/data/category_response.dart';
import '../model/products_model.dart';
import '../model/products_response.dart';
import '../model/wishlist_response.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchProducts({
    String? category,
  }) async {
    try {
      final endpoint = category != null
          ? '${ApiEndPoint.getAllProducts}?category=$category'
          : ApiEndPoint.getAllProducts;

      final response = await api.get(endpoint);

      final productsResponse = ProductsResponse.fromJson(response);

      return Right(productsResponse.data);
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, List<ProductsModel>>> searchProducts({
    String? query,
  }) async {
    try {
      final endpoint = "${ApiEndPoint.searchProducts}?query=$query";

      final response = await api.get(endpoint);

      final productsResponse = ProductsResponse.fromJson(response);

      final products = productsResponse.data;

      return Right(products);
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, List<ProductsModel>>> addProductToWishlist({
    String? id,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoint.addToWishList,
        data: {"productId": id},
      );
      final wishlistResponse = WishlistResponse.fromJson(response);
      final products = wishlistResponse.items
          .map((item) => item.product)
          .whereType<ProductsModel>()
          .toList();
      return Right(products);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchWishlist() async {
    try {
      final response = await api.get(ApiEndPoint.getWishList);

      final wishlistResponse = WishlistResponse.fromJson(response);

      final products = wishlistResponse.items
          .map((item) => item.product)
          .whereType<ProductsModel>()
          .toList();

      return Right(products);
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchCategories() async {
    try {
      final response = await api.get(ApiEndPoint.fetchCategories);
      final productsResponse = ProductsResponse.fromJson(response);
      return Right(productsResponse.data);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchProductsByCategory({
    required String category,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoint.fetchProductsByCategory,
        data: {'category': category},
      );
      final categoryResponse = CategoryResponse.fromJson(response);
      return Right(categoryResponse.products);
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: e.toString())),
      );
    }
  }
}
