import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/services/api/api_consumer.dart';
import '../../../../../../core/services/api/api_endpoint.dart';
import '../../../../../../core/services/errors/exceptions.dart';
import '../../../../auth/data/models/sign_out_model.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.api) : super(SignOutInitial());

  final ApiConsumer api;
  SignOutModel? user;

  Future<void> signOut() async {
    try {
      emit(SignOutLoading());
      final response = await api.post(ApiEndPoint.signOut, data: {});
      user = SignOutModel.fromJson(response);
      await removeToken();
      final removed = await isTokenRemoved();
      if (removed) {
        emit(SignOutSuccess());
      } else {
        emit(SignOutFailure(errMassege: "Failed to remove token locally"));
      }
    } on ServerException catch (e) {
      emit(SignOutFailure(errMassege: e.errorModel.message));
    }
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<bool> isTokenRemoved() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token') == null;
  }
}
