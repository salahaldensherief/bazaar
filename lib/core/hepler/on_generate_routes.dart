import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top/core/services/api/api_consumer.dart';
import 'package:mega_top/core/services/api/dio_consumer.dart';
import 'package:mega_top/features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'package:mega_top/features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import 'package:mega_top/features/home/data/repos/home_repo.dart';
import 'package:mega_top/features/home/data/repos/home_repo_impl.dart';
import 'package:mega_top/features/home/presentation/manger/products/products_cubit.dart';
import 'package:mega_top/features/search/presentation/cubit/search_cubit.dart';

import '../../features/account/presentation/views/account_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/widgets/bottom_nav_bar.dart';
import '../../features/offers/presentation/views/offers_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/search/presentation/views/widgets/search_page_view_body.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case BottomNavBar.routeName:
      return MaterialPageRoute(builder: (context) =>
          BottomNavBar());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) =>
          BlocProvider(
            create: (context) => SignInCubit(DioConsumer(dio: Dio())),
            child: LoginView(),
          ));
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) =>
          BlocProvider(
            create: (context) => SignUpCubit(DioConsumer(dio: Dio())),
            child: SignUpView(),
          ));
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());
    case AccountView.routeName:
      return MaterialPageRoute(builder: (context) => AccountView());
    case CategoriesView.routeName:
      return MaterialPageRoute(builder: (context) => CategoriesView());
    case OffersView.routeName:
      return MaterialPageRoute(builder: (context) => OffersView());
    case SearchViewBody.routeName:
      return MaterialPageRoute(builder: (context) =>
          SearchViewBody());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
