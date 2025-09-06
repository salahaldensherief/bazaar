import 'package:dartz/dartz.dart';
  import 'package:mega_top/core/services/errors/exceptions.dart';
  import 'package:mega_top/features/home/data/model/products_model.dart';

  import '../model/wishlist_response.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<ProductsModel>>> fetchProducts({String? category});
  Future<Either<ServerException, List<ProductsModel>>> searchProducts({String? query});
}
