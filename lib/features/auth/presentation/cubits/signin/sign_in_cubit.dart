import 'package:bloc/bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/api/api_endpoint.dart';
import '../../../../../core/services/api/dio_consumer.dart';
import '../../../../../core/services/errors/exceptions.dart';
import '../../../../../core/services/getit/service_locator.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../data/models/sign_in_model.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final DioConsumer api;
  SignInCubit(this.api) : super(SignInInitial());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignInModel? user;
  Future<void> logIn() async {
    try {
      emit(SignInLoading());

      final response = await api.dio.post(
        ApiEndPoint.login,
        data: {
          ApiEndPoint.email: signInEmail.text,
          ApiEndPoint.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response.data);

      if (user?.user != null) {
        if (sl.isRegistered<User>()) {
          sl.unregister<User>();
        }
        sl.registerSingleton<User>(user!.user!);
      }
      if (user?.token != null) {
        await Prefs.setString('auth_token', user!.token!);
      }

      if (user?.user?.id != null) {
        await Prefs.setString('user_id', user!.user!.id!);
        debugPrint("Saved user_id: ${user!.user!.id!}");
      }

      final setCookie = response.headers['set-cookie'];
      if (setCookie != null) {
        for (var cookieStr in setCookie) {
          if (cookieStr.contains('connect.sid')) {
            final cookieParts = cookieStr.split(';')[0].split('=');
            final connectSid = cookieParts.length > 1 ? cookieParts[1] : '';
            final uri = Uri.parse(ApiEndPoint.baseUrl);
            final cookie = Cookie('connect.sid', connectSid)
              ..httpOnly = true
              ..secure = false
              ..path = '/';
            await api.cookieJar.saveFromResponse(uri, [cookie]);
            break;
          }
        }
      }
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMassege: e.errorModel.message));
    }
  }
  Future<void> logOut() async {
    await Prefs.remove('auth_token');
    user = null;
    if (sl.isRegistered<User>()) {
      sl.unregister<User>();
      debugPrint("User removed from GetIt");
    }
    emit(SignInInitial());
  }
}
