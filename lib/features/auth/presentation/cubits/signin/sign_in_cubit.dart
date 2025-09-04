import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mega_top/core/services/api/api_consumer.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/services/api/api_endpoint.dart';
import '../../../../../core/services/errors/exceptions.dart';
import '../../../data/models/sign_in_model.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
 final ApiConsumer api;
  SignInCubit(this.api) : super(SignInInitial());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignInModel? user;
  LogIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        ApiEndPoint.login,
        data: {ApiEndPoint.email: signInEmail.text, ApiEndPoint.password: signInPassword.text},
      );
user = SignInModel.fromJson(response);
      emit(SignInSuccess());
      saveToken(user!.token!);
    } on ServerException catch (e) {
      emit(SignInFailure(errMassege: e.errorModel.message));
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
}

