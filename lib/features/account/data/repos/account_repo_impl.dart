import 'package:Bazaar/core/services/api/api_endpoint.dart';
import 'package:Bazaar/core/services/api/dio_consumer.dart';
import 'package:Bazaar/core/services/errors/exceptions.dart';
import 'package:Bazaar/features/account/data/repos/account_repo.dart';
import 'package:Bazaar/features/auth/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/errors/error_model.dart';

class AccountRepoImpl implements AccountRepo {
  final DioConsumer api;

  AccountRepoImpl(this.api);
  Future<Either<ServerException, SignUpModel>> getUserData() async {
    try {
      final response = await api.get(ApiEndPoint.getUserDetails);
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } catch (e) {
      return left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }
  @override
  Future<Either<ServerException, SignUpModel>> updateUserData({required String name, required String email,  required String userId,
  }) async {
    try {
      final response = await api.patch(
          '${ApiEndPoint.editUser}/$userId ',data: {'username': name, 'email': email});
      return Right(SignUpModel.fromJson(response));
    } catch (e) {
      return Left(ServerException(errorModel: ErrorModel(message: e.toString())));
    }
  }
}