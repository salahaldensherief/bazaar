import 'package:dartz/dartz.dart';
import 'package:mega_top/core/services/errors/exceptions.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';
import 'package:mega_top/features/home/data/model/products_response.dart';

import '../../../../core/services/api/api_endpoint.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/errors/error_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<ProductsModel>>> fetchBestSeller() async {
    try {
      final response = await api.get(ApiEndPoint.getAllProducts);

      final productsResponse = ProductsResponse.fromJson(response);

      return Right(productsResponse.data);
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }
}
