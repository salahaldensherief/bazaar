
import 'package:dartz/dartz.dart';

import '../../../../core/services/errors/exceptions.dart';
import '../order_model.dart';

abstract class OrderRepo {
  Future<Either<ServerException, List<OrderModel>>> getOrders();


}