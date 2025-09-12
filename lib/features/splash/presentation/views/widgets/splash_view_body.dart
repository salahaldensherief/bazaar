import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/assets_images.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../home/presentation/views/widgets/bottom_nav_bar.dart';
import '../../../../onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: SvgPicture.asset(AssetsData.logo2, width: 150.w,))],
      ),
    );
  }

  void excuteNavigation() async {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    String? token = Prefs.getString('auth_token');

    Future.delayed(const Duration(seconds: 3), () {
      if (!isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      } else if (token != null && token.isNotEmpty) {
        Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }
}
