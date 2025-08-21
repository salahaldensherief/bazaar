import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AssetsData.logo, width: 150.w,),),
        ],
      ),
    );
  }

    void excuteNaviagtion() {
      Future.delayed(Duration(
        seconds: 3,), (){
        Navigator.pushNamed(context, OnboardingView.routeName);
      }
      );
  }
}
