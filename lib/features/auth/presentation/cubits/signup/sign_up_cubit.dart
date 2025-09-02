import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mega_top/features/auth/data/models/sign_up_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/services/api/api_consumer.dart';
import '../../../../../core/services/api/api_endpoint.dart';
import '../../../../../core/services/errors/exceptions.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiConsumer api;

  SignUpCubit(this.api) : super(SignUpInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpUsername = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  SignUpModel? user;
  SignUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        ApiEndPoint.register,
        data: {
          ApiEndPoint.email: signUpEmail.text,
          ApiEndPoint.password: signUpPassword.text,
          ApiEndPoint.username: signUpUsername.text,
        },
      );
      user = SignUpModel.fromJson(response);
      emit(SignUpSuccess());
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.message));
    }
  }
}
