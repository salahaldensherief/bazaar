import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  String _selectedOption = 'Default';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          RadioListTile<String>(
             activeColor: AppColors.primaryColor,
            value: 'Default',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            title: const Text(
              "Default",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Price high to low
          RadioListTile<String>(
            activeColor: AppColors.primaryColor,

            value: 'highToLow',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Price : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " From high to low"),
                ],
              ),
            ),
          ),
          // Price low to high
          RadioListTile<String>(
            activeColor: AppColors.primaryColor,
            value: 'lowToHigh',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Price : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " From low to high"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
