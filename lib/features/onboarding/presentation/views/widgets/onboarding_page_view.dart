import 'package:Bazaar/features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_images.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: AssetsData.magnifer,
          subtitle:
              "Lorem Ipsum is simply dummy text of the printing \n and typesetting industry. Lorem Ipsum has been the \n industry's standard dummy text ever since the \n 1500s, when an unknown printer.",
          title: 'Explore our electronic products',
        ),
        PageViewItem(
          image: AssetsData.Group,
          subtitle:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.",
          title: 'Add your products to the shopping cart',
        ),
        PageViewItem(
          image: AssetsData.box,
          subtitle:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.",
          title: 'Receive your order successfully',
        ),
      ],
    );
  }
}
