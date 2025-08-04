// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
              // Navigator.pushNamed(context, SignUpView.routeName);
            },
            text: 'SignUp',style: TextStyle(color: Color(0xff4991BF)),),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
