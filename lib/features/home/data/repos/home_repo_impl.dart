import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/services/api/api_endpoint.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/errors/error_model.dart';
import '../../../../core/services/errors/exceptions.dart';
import '../../../cart/data/cart_response.dart';
import '../../../categories/presentation/data/category_response.dart';
import '../model/products_model.dart';
import '../model/products_response.dart';
import '../model/wishlist_item.dart';
import '../model/wishlist_response.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer api;
  final Box<ProductsModel> productsBox = Hive.box<ProductsModel>('productsBox');
  final Box<ProductsModel> categoriesBox = Hive.box<ProductsModel>(
    'categoriesBox',
  );

  HomeRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchProducts({
    String? category,
  }) async {
    try {
      final cached = productsBox.values.toList();
      if (cached.isNotEmpty) {
        return Right(cached);
      }
      final endpoint = category != null
          ? '${ApiEndPoint.getAllProducts}?category=$category'
          : ApiEndPoint.getAllProducts;

      final response = await api.get(endpoint);
      final productsResponse = ProductsResponse.fromJson(response);
      final products = productsResponse.data;

      await productsBox.clear();
      await productsBox.addAll(products);

      return Right(products);
    } on ServerException catch (e) {
      final cached = productsBox.values.toList();
      if (cached.isNotEmpty) {
        return Right(cached);
      }
      return Left(e);
    } catch (e) {
      final cached = productsBox.values.toList();
      if (cached.isNotEmpty) {
        return Right(cached);
      }
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
  Future<Either<ServerException, List<WishlistItem>>> fetchWishlist() async {
    try {
      final response = await api.get(ApiEndPoint.getWishList);
      final wishlistResponse = WishlistResponse.fromJson(response);

      final items = wishlistResponse.items
          .map((item) => WishlistItem(sId: item.sId, product: item.product))
          .toList();

      return Right(items);
    } catch (e) {
      return Left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }


  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchCategories() async {
    try {
      final cached = categoriesBox.values.toList();
      if (cached.isNotEmpty) return Right(cached);

      final response = await api.get(ApiEndPoint.fetchCategories);
      final productsResponse = ProductsResponse.fromJson(response);
      final products = productsResponse.data;

      await categoriesBox.clear();
      await categoriesBox.addAll(products);

      return Right(products);
    } on ServerException catch (e) {
      final cached = categoriesBox.values.toList();
      if (cached.isNotEmpty) return Right(cached);
      return Left(e);
    } catch (e) {
      final cached = categoriesBox.values.toList();
      if (cached.isNotEmpty) return Right(cached);
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

  @override
  Future<Either<ServerException, List<WishlistItem>>> removeProductFromWishList(
      String wishlistItemId) async {
    try {
      final response = await api.delete(
        ApiEndPoint.deleteFromWishList,
        data: {"productId": wishlistItemId},
      );

      // إعادة جلب القائمة بعد الحذف
      return fetchWishlist();
    } catch (e) {
      return Left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }
}

