import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mega_top/core/utils/assets_images.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final bool centerTitle;
  final bool showCart;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.centerTitle = true,
    this.showCart = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: widget.showBack
              ? GestureDetector(
                  onTapDown: (_) {
                    setState(() => _isPressed = true);
                  },
                  onTapUp: (_) {
                    setState(() => _isPressed = false);
                    (widget.onBack ?? () => Navigator.of(context).pop())();
                  },
                  onTapCancel: () {
                    setState(() => _isPressed = false);
                  },
                  child: AnimatedContainer(
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    duration: const Duration(milliseconds: 20),
                    decoration: BoxDecoration(
                      color: _isPressed
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SvgPicture.asset(
                      _isPressed
                          ? AssetsData.BackArrowWhite
                          : AssetsData.Backarrow,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                )
              : null,
          centerTitle: widget.centerTitle,
          title: Text(
            widget.title,
            style: TextStyles.bold22.copyWith(color: Colors.black),
          ),
          actions: [
            Visibility(
              visible: widget.showCart,

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.backIconColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      width: 15.w,
                      height: 20.h,
                         AssetsData.favAc,
                      fit: BoxFit.scaleDown,
                                          ),
                  ),
                    ),
                ),
              ),

          ],
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(

                color: Colors.black26.withOpacity(.2),
                spreadRadius: .1,
                offset: const Offset(0, 1),

                blurRadius: 2,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
