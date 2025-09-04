import 'package:dartz/dartz.dart';
import 'package:mega_top/core/services/errors/exceptions.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<ProductsModel>>> fetchBestSeller();
}