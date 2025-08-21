import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/hepler/on_generate_routes.dart';
import 'package:mega_top/core/utils/app_colors.dart';

import 'features/home/presentation/views/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          useMaterial3: false,
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: AppColors.backgraoundColor,
          primaryColor: AppColors.primaryColor,
        ),
        initialRoute: BottomNavBar.routeName,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
