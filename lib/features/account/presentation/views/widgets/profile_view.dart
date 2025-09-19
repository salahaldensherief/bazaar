import 'package:Bazaar/core/utils/app_colors.dart';
import 'package:Bazaar/core/utils/text_styles.dart';
import 'package:Bazaar/core/widgets/custom_app_bar.dart';
import 'package:Bazaar/features/account/presentation/cubits/accountDetails/account_detailes_cubit.dart';
import 'package:Bazaar/features/account/presentation/views/widgets/profile_container_widget.dart';
import 'package:Bazaar/features/account/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/services/getit/service_locator.dart' as ls;
import '../../../../../core/utils/assets_images.dart';
import '../../../data/repos/account_repo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profileview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBack: true, title: 'Profile'),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            SvgPicture.asset(AssetsData.logo2, height: 60.h),
            SizedBox(height: 40.h),
            ProfileContainersWidget(
              img: AssetsData.personalAccount,
              title: 'Edit profile details',
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => AccountDetailesCubit(accountRepo: ls.sl<AccountRepo>())..fetchUserData(),
                        child: ProfileViewBody(),
                    ),));
              },
            ),
            SizedBox(height: 24.h),
            ProfileContainersWidget(
              img: AssetsData.removeAccount,
              title: 'Delete account',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
