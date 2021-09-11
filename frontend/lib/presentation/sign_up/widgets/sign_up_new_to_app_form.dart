import 'package:flutter/material.dart';
import 'package:frontend/presentation/core/widgets/cta_button.dart';
import 'package:frontend/presentation/core/widgets/form_header_text.dart';
import 'package:frontend/presentation/core/widgets/password_field.dart';

class SignUpForNewToAppForm extends StatelessWidget {
  const SignUpForNewToAppForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          FormHeaderText(
            header1Text: 'Welcome',
            header2Text:
                'Please update your password before you start using the app',
          ),
          SizedBox(
            height: 35.0,
          ),
          PasswordField(
            key: Key("Password"),
            hintText: 'New password',
          ),
          SizedBox(
            height: 25.0,
          ),
          CtaButton(
            key: Key("updatePassword"),
            actionText: 'Update password',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
