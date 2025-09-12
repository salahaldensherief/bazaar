// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signup_view.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

// Project imports:


class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Dont Have an acount?  ',

          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap= (){
              Navigator.pushNamed(context, SignUpView.routeName);
            },
            text: 'SignUp',style: TextStyles.medium15.copyWith(
            color: AppColors.primaryColor
          ),),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
