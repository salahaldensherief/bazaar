import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // selected offers
  Map<String, bool> brands = {"Dell": false, "Acer": false, "Toshiba": false};

  // price range
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Brand", style: TextStyles.medium15),
            SizedBox(height: 8.h),
            ...brands.keys.map((brand) {
              return CheckboxListTile(
                activeColor: AppColors.primaryColor,
                value: brands[brand],
                onChanged: (val) {
                  setState(() {
                    brands[brand] = val!;
                  });
                },
                title: Text(brand),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              );
            }).toList(),

            SizedBox(height: 8.h),
            Text("Price", style: TextStyles.medium15),
            SizedBox(height: 8.h),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: TextField(

                      controller: fromController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "From",
                        hintText: "Price in EGP",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: TextField(
                      controller: toController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "To",
                        hintText: "Price in EGP",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 70.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    "offers": brands,
                    "from": fromController.text,
                    "to": toController.text,
                  });
                },
                child: Text("Apply", style: TextStyles.bold22),
              ),
            ),

            SizedBox(height: 8.h),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.primaryColor),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                onPressed: () {
                  setState(() {
                    brands.updateAll((key, value) => false);
                    fromController.clear();
                    toController.clear();
                  });
                },
                child: Text(
                  "Reset",
                  style: TextStyles.bold22.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
