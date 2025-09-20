import 'package:dartz/dartz.dart';
import '../../../../core/services/api/api_endpoint.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/errors/error_model.dart';
import '../../../../core/services/errors/exceptions.dart';
import '../order_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DioConsumer api;

  OrderRepoImpl({required this.api});

  @override
  Future<Either<ServerException, List<OrderModel>>> getOrders() async {
    try {
      final response = await api.get(ApiEndPoint.getOrder);

      if (response is! Map<String, dynamic>) {
        return left(ServerException(
          errorModel: ErrorModel(message: "Invalid server response"),
        ));
      }

      final data = response["data"] as List<dynamic>? ?? [];
      final orders = data.map((e) => OrderModel.fromJson(e)).toList();

      return right(orders);
    } catch (e) {
      return left(ServerException(
        errorModel: ErrorModel(message: e.toString()),
      ));
    }
  }
}
