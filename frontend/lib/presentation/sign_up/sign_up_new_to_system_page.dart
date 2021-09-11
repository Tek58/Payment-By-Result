import 'package:flutter/material.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_new_to_system_form.dart';

import '../colors.dart';

class SignUpForNewToSystemPage extends StatelessWidget {
  const SignUpForNewToSystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SignUpForNewToSystemForm(
            key: Key("SignUpForNewToSystemForm"),
          ),
        ),
      ),
    );
  }
}
