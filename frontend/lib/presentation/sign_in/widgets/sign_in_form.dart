import 'package:flutter/material.dart';
import 'package:frontend/presentation/core/widgets/cta_button.dart';
import 'package:frontend/presentation/core/widgets/form_bottom_question.dart';
import 'package:frontend/presentation/core/widgets/password_field.dart';
import 'package:frontend/presentation/core/widgets/text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          Image.asset('assets/illustration.png'),
          SizedBox(
            height: 15.0,
          ),
          CustomTextField(
            key: Key("Email"),
            hintText: 'Email',
          ),
          SizedBox(
            height: 10.0,
          ),
          PasswordField(
            key: Key("Password"),
            hintText: 'Password',
          ),
          SizedBox(
            height: 25.0,
          ),
          CtaButton(
            key: Key("Login") ,
            actionText: 'Sign In',
            onPressed: () {},
          ),
          SizedBox(height: 5.0),
          FormBottomQuestion(
            questionText: "Don't have an account?",
            actionText: 'Sign Up',
            onAction: () {},
          ),
        ],
      ),
    );
  }
}
