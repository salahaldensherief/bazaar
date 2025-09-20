// service_locator.dart
import 'package:Bazaar/features/cart/data/repos/order_repo.dart';
import 'package:Bazaar/features/cart/presentation/cubits/order/order_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../../../features/auth/data/models/sign_in_model.dart';
import '../../../features/account/data/repos/account_repo.dart';
import '../../../features/account/data/repos/account_repo_impl.dart';
import '../../../features/account/presentation/cubits/accountDetails/account_detailes_cubit.dart';
import '../../../features/cart/data/repos/cart_repo.dart';
import '../../../features/cart/data/repos/cart_repo_impl.dart';
import '../../../features/cart/data/repos/order_repo_impl.dart';
import '../../../features/cart/presentation/cubits/cart/cart_cubit.dart';
import '../../../features/home/data/repos/home_repo.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/presentation/manger/products/products_cubit.dart';
import '../../../features/home/presentation/manger/wishList/wish_list_cubit.dart';
import '../../../features/search/presentation/cubit/search_cubit.dart';
import '../../../features/categories/presentation/cubits/category/categories_cubit.dart';
import '../../../features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import '../../../features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio();
  final cookieJar = CookieJar();
  sl.registerLazySingleton<DioConsumer>(
    () => DioConsumer(dio: dio, sharedCookieJar: cookieJar),
  );

  // Repositories
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(api: sl<DioConsumer>()),
  );
  sl.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(api: sl<DioConsumer>()),
  );
  sl.registerLazySingleton<AccountRepo>(
    () => AccountRepoImpl(sl<DioConsumer>()),
  );
  // sl.registerLazySingleton<OrderRepo>(
  //   () => OrderRepoImpl(api: sl<DioConsumer>()),
  // );

  sl.registerLazySingleton<User>(() => User());

  sl.registerFactory(() => SignInCubit(sl<DioConsumer>()));
  sl.registerFactory(() => SignUpCubit(sl<DioConsumer>()));
  sl.registerFactory(() => ProductsCubit(sl<HomeRepo>()));
  sl.registerFactory(() => SearchCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => WishlistCubit(homeRepo: sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(homeRepo: sl<HomeRepo>()));
  // sl.registerFactory(() => OrderCubit(repository: sl<OrderRepo>()));
  sl.registerFactory(() => CartCubit(cart: sl<CartRepo>(), user: sl<User>()));

  sl.registerFactory(
    () => AccountDetailesCubit(accountRepo: sl<AccountRepo>()),
  );
}
