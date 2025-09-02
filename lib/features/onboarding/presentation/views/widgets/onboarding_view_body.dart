import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/widgets/have_an_account.dart';
import 'package:mega_top/features/home/presentation/views/home_view.dart';
import 'package:mega_top/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'onboarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(

      children: [
        Expanded(
          flex: 3,
          child: OnBoardingPageView(pageController: pageController),
        ),
        Column(
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 40.w,
                  height: 8.h,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                dotDecoration: DotDecoration(
                  width: 8.w,
                  height: 8.h,
                  color: AppColors.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
             SizedBox(height: 20.h),
            CustomButton(

              fontColor: Colors.white,
              colorSide: AppColors.primaryColor,
              color: AppColors.primaryColor,
              onPressed: () {
                Prefs.setBool(kIsOnBoardingViewSeen, true);
                if (currentPage < 2) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                 Navigator.pushNamed(context, BottomNavBar.routeName);
                }
              },
              text: currentPage < 2 ? 'Next' : 'Get started',
            ),
            SizedBox(height: 10.h,),

            Visibility(
                visible: currentPage == 2,

                child: HaveAnAccountWidget()),
            SizedBox(height: 70.h,)
          ],
        ),
      ],
    );
  }
}
