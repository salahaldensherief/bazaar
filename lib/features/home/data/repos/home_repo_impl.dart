import 'package:dartz/dartz.dart';
import 'package:mega_top/core/services/errors/exceptions.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';
import 'package:mega_top/features/home/data/model/products_response.dart';

import '../../../../core/services/api/api_endpoint.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/errors/error_model.dart';
import '../model/wishlist_response.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchProducts({String? category}) async {
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
}

  // @override
  // Future<Either<ServerException, WishlistResponse>> fetchWishList() async {
  //   try {
  //     final response = await api.get(ApiEndPoint.getWishList);
  //
  //     final wishlistResponse = WishlistResponse.fromJson(response);
  //     return Right(wishlistResponse);
  //   } on ServerException catch (e) {
  //     return Left(e);
  //   } catch (e) {
  //     return Left(
  //       ServerException(errorModel: ErrorModel(message: e.toString())),
  //     );
  //   }
  // }
  //
  // @override
  // Future<Either<ServerException, WishlistResponse>> addProductToWishList(
  //     String productId
  // ) async {
  //   try {
  //     final response = await api.post(
  //       ApiEndPoint.addToWishList,
  //       data: {"_id": productId},
  //     );
  //
  //     final wishlistResponse = WishlistResponse.fromJson(response);
  //     return Right(wishlistResponse);
  //   } on ServerException catch (e) {
  //     return Left(e);
  //   } catch (e) {
  //     return Left(
  //       ServerException(errorModel: ErrorModel(message: e.toString())),
  //     );
  //   }
  // }
  //
  // @override
  // Future<Either<ServerException, WishlistResponse>> removeProductFromWishList(
  //   String productId,
  // ) async {
  //   try {
  //     final response = await api.delete(
  //       "${ApiEndPoint.deleteFromWishList}/$productId",
  //     );
  //
  //     final wishlistResponse = WishlistResponse.fromJson(response);
  //     return Right(wishlistResponse);
  //   } on ServerException catch (e) {
  //     return Left(e);
  //   } catch (e) {
  //     return Left(
  //       ServerException(errorModel: ErrorModel(message: e.toString())),
  //     );
  //   }
  // }

