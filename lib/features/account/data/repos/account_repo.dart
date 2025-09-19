import 'package:Bazaar/core/services/errors/exceptions.dart';
import 'package:Bazaar/features/auth/data/models/sign_in_model.dart';
import 'package:Bazaar/features/auth/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepo {
  Future<Either<ServerException, SignUpModel>> getUserData();
  Future<Either<ServerException, SignUpModel>> updateUserData({
    required String name,
    required String email,
    required String userId,
  });
}
