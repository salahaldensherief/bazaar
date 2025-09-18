import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/hepler/on_generate_routes.dart';
import 'core/services/getit/service_locator.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_colors.dart';
import 'features/home/data/model/products_model.dart';
import 'features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  await Hive.openBox<ProductsModel>('productsBox');
  await Hive.openBox<ProductsModel>('categoriesBox');

  runApp(const BazaarApp());
}

class BazaarApp extends StatelessWidget {
  const BazaarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
          useMaterial3: false,
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: AppColors.backgraoundColor,
          primaryColor: AppColors.primaryColor,
        ),
        initialRoute: SplashView.routeName,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
