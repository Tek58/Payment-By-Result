import 'package:flutter/material.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_new_to_app_form.dart';

import '../colors.dart';

class SignUpForNewToAppPage extends StatelessWidget {
  const SignUpForNewToAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SignUpForNewToAppForm(
            key: Key("SignUpForNewToAppForm"),
          ),
        ),
      ),
    );
  }
}
