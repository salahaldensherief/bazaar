// service_locator.dart
import 'package:Bazaar/features/cart/data/repos/cart_repo.dart';
import 'package:Bazaar/features/cart/data/repos/cart_repo_impl.dart';
import 'package:Bazaar/features/cart/presentation/cubits/cart/cart_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../../../features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import '../../../features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import '../../../features/cart/presentation/cubits/checkout/checkout_cubit.dart';
import '../../../features/categories/presentation/cubits/category/categories_cubit.dart';
import '../../../features/home/data/repos/home_repo.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/presentation/manger/products/products_cubit.dart';
import '../../../features/home/presentation/manger/wishList/wish_list_cubit.dart';
import '../../../features/search/presentation/cubit/search_cubit.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1️⃣ Dio + CookieJar
  final dio = Dio();
  final cookieJar = CookieJar();

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: dio, sharedCookieJar: cookieJar));

  // ---------- Repositories ----------
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(api: sl<DioConsumer>()));
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl( api: sl<DioConsumer>()));

  // ---------- Cubits ----------
  sl.registerFactory(() => SignInCubit(sl()));
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => ProductsCubit(sl()));
  sl.registerFactory(() => SearchCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => WishlistCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => CartCubit( cart: sl<CartRepo>()));

}
