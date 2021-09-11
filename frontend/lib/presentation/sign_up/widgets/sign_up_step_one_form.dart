import 'package:flutter/material.dart';
import 'package:frontend/presentation/core/widgets/cta_button.dart';
import 'package:frontend/presentation/core/widgets/form_bottom_question.dart';
import 'package:frontend/presentation/core/widgets/text_field.dart';

class SignUpStepOneForm extends StatelessWidget {
  const SignUpStepOneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Image.asset('assets/illustration.png'),
          SizedBox(
            height: 15.0,
          ),
          CustomTextField(
            hintText: 'Email',
          ),
          SizedBox(
            height: 25.0,
          ),
          CtaButton(
            key: Key("signup"),
            actionText: 'Sign Up',
            onPressed: () {},
          ),
          SizedBox(height: 5.0),
          FormBottomQuestion(
            questionText: "Already have an account?",
            actionText: 'Sign In',
            onAction: () {},
          ),
        ],
      ),
    );
  }
}
