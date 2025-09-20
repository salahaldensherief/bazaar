import 'package:Bazaar/features/account/presentation/views/widgets/profile_view.dart';
import 'package:Bazaar/features/cart/presentation/cubits/order/order_cubit.dart';
import 'package:Bazaar/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/account/presentation/views/account_view.dart';
import '../../features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import '../../features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/cart/presentation/views/widgets/payment_method_view.dart';
import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/home/presentation/manger/wishList/wish_list_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/widgets/bottom_nav_bar.dart';
import '../../features/home/presentation/views/widgets/wishlist_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/search/presentation/views/widgets/search_page_view_body.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../services/getit/service_locator.dart' as di;
import '../../features/cart/presentation/views/widgets/order_summary_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case BottomNavBar.routeName:
      return MaterialPageRoute(builder: (context) => BottomNavBar());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => di.sl<SignInCubit>(),
          child: LoginView(),
        ),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => di.sl<SignUpCubit>(),
          child: SignUpView(),
        ),
      );
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());
    case AccountView.routeName:
      return MaterialPageRoute(builder: (context) => AccountView());
    case CategoriesView.routeName:
      return MaterialPageRoute(builder: (context) => CategoriesView());
    case SearchViewBody.routeName:
      return MaterialPageRoute(builder: (context) => SearchViewBody());
    case WishlistView.routeName:
      return MaterialPageRoute(
        builder: (context) => WishlistView(homeRepo: di.sl<HomeRepo>()),
      );
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileView());
    case PaymentMethodView.routeName:
      return MaterialPageRoute(builder: (context) => PaymentMethodView());
    case OrderSummaryView.routeName:
      return MaterialPageRoute(
        builder: (context) => OrderSummaryView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
