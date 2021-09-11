import 'package:flutter/material.dart';
import 'package:frontend/presentation/core/widgets/cta_button.dart';
import 'package:frontend/presentation/core/widgets/date_input_formfiled.dart';
import 'package:frontend/presentation/core/widgets/form_header_text.dart';
import 'package:frontend/presentation/core/widgets/password_field.dart';
import 'package:frontend/presentation/core/widgets/text_field.dart';

class SignUpForNewToSystemForm extends StatelessWidget {
  const SignUpForNewToSystemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          FormHeaderText(
            header1Text: 'Welcome',
            header2Text:
                'Please provide the following info so that we can setup your account',
          ),
          SizedBox(
            height: 35.0,
          ),
          CustomTextField(
            key: Key("Name"),
            hintText: 'Name',
          ),
          SizedBox(
            height: 10.0,
          ),
          DateInputField(
            key: Key("DateOfBirth"),
            hintText: 'Date of birth',
            controller: TextEditingController(),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomTextField(
            key: Key("PhoneNumber"),
            hintText: 'Phone number',
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
            key: Key("submit"),
            actionText: 'Submit',
            onPressed: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}
