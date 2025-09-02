import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, 
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.onSaved,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(


          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          onSaved: onSaved,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(

            ),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.black54,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
         SizedBox(height: 1.h),
        Container(
          height: 2.h,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffE6E6E6)),
        ),
      ],
    );
  }
}
