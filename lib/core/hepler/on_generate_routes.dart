
import 'package:flutter/material.dart';

import '../../features/account/presentation/views/account_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/brands/presentation/views/brands_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/widgets/bottom_nav_bar.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

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
      return MaterialPageRoute(builder: (context) => LoginView());
      case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());
      case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());
      case AccountView.routeName:
      return MaterialPageRoute(builder: (context) => AccountView());
      case CategoriesView.routeName:
      return MaterialPageRoute(builder: (context) => CategoriesView());
      case BrandsView.routeName:
      return MaterialPageRoute(builder: (context) => BrandsView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
