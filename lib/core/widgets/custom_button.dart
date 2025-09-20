import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.colorSide,
    required this.fontColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color colorSide;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size(343.w, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: color,
          side: BorderSide(color: colorSide),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold23.copyWith(
            fontSize: 16,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
