import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top/core/services/api/api_consumer.dart';
import 'package:mega_top/core/services/api/dio_consumer.dart';
import 'package:mega_top/core/utils/assets_images.dart';
import 'package:mega_top/features/account/presentation/views/widgets/settings_tile.dart';
import 'package:mega_top/features/account/presentation/views/widgets/category_name.dart';
import 'package:mega_top/features/account/presentation/views/widgets/sign_out_widget.dart';
import 'package:mega_top/features/home/presentation/views/widgets/icons_app_bar.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../cubits/signout/sign_out_cubit.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Account'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: IconAppBar(
                    radius: 30.r,
                    subTitle: 'SalahSheref48@gmail.com',
                    solidBell: false,
                    showHeart: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 43.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryName(category: 'Account'),
                  SizedBox(height: 28.h),
                  SettingsTile(
                    iconImage: AssetsData.ordersFill,
                    title: 'Orders',
                    isShow: true,
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.favourFilled,
                    title: 'Wish List',
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.notification,
                    title: 'Notifications',
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.mapAcc,
                    title: 'Shipping Addresses',
                  ),
                  SizedBox(height: 43.h),
                  CategoryName(category: 'Settings'),
                  SizedBox(height: 28.h),

                  SettingsTile(
                    iconImage: AssetsData.profileAcc,
                    title: 'Profile',
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.language,
                    title: 'Languages',
                  ),
                  SizedBox(height: 43.h),

                  CategoryName(category: 'Contact us'),
                  SizedBox(height: 28.h),

                  SettingsTile(iconImage: AssetsData.contact, title: 'Call us'),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.exclamation,
                    title: 'About us',
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.exclamation,
                    title: 'Terms & Conditions',
                  ),
                  SizedBox(height: 16.h),
                  SettingsTile(
                    iconImage: AssetsData.exclamation,
                    title: 'Privacy Policy',
                  ),
                  SizedBox(height: 45.h),
                  BlocProvider(
                    create: (context) => SignOutCubit(DioConsumer(dio: Dio())),
                    child: SignOutWidget(),
                  ),
                  SizedBox(height: 45.h),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
