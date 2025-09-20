import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentContainerDetailsWidget extends StatelessWidget {
  final Widget widget;
  final String title;
  const PaymentContainerDetailsWidget({
    super.key,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.medium15.copyWith(color: AppColors.black19),
          ),
          Divider(),
          Column(children: [widget]),
        ],
      ),
    );
  }
}
