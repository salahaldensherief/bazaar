import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/brands/presentation/views/brands_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../cart/presentation/views/cart_view.dart';
import '../../../../categories/presentation/views/categories_view.dart';
import '../home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const routeName = 'bottomnavbar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    CategoriesView(),
    BrandsView(),
    CartView(),
    AccountView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem({
    required int index,
    required String activeIconPath,
    required String inactiveIconPath,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? activeIconPath : inactiveIconPath,
            width: 26,
            height: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryColor : Color(0xff999999),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabWidth = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  index: 0,
                  activeIconPath: AssetsData.homeAc,
                  inactiveIconPath: AssetsData.home,
                  label: 'Home',
                ),
                _buildNavItem(
                  index: 1,
                  activeIconPath: AssetsData.categoriesAc,
                  inactiveIconPath: AssetsData.categories,
                  label: 'Categories',
                ),
                _buildNavItem(
                  index: 2,
                  activeIconPath: AssetsData.brandsAc,
                  inactiveIconPath: AssetsData.brands,
                  label: 'Brands',
                ),
                _buildNavItem(
                  index: 3,
                  activeIconPath: AssetsData.bagAc,
                  inactiveIconPath: AssetsData.bag,
                  label: 'Cart',
                ),
                _buildNavItem(
                  index: 4,
                  activeIconPath: AssetsData.accountAc,
                  inactiveIconPath: AssetsData.account,
                  label: 'Accounts',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 100),
              alignment: Alignment(-1.0 + (_selectedIndex * 0.5), 0),

              child: Container(
                width: tabWidth,
                height: 2.2,
                decoration: BoxDecoration(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
