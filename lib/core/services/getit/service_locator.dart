// service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mega_top/core/services/api/dio_consumer.dart';

import '../../../features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import '../../../features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import '../../../features/home/data/repos/home_repo.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/presentation/manger/products/products_cubit.dart';
import '../../../features/home/presentation/manger/wishList/wish_list_cubit.dart';
import '../../../features/search/presentation/cubit/search_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1️⃣ Dio + CookieJar
  final dio = Dio();
  final cookieJar = CookieJar();

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: dio, sharedCookieJar: cookieJar));

  // ---------- Repositories ----------
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(api: sl<DioConsumer>()));

  // ---------- Cubits ----------
  sl.registerFactory(() => SignInCubit(sl())); // Factory: create new instance every time
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => ProductsCubit(sl()));
  sl.registerFactory(() => SearchCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => WishlistCubit(homeRepo: sl<HomeRepo>()));

}
