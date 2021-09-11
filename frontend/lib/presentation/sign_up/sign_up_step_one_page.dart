import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/application/auth/sign_up_step1/sign_up_step1_bloc.dart';
import 'package:frontend/injection.dart';
import 'package:frontend/presentation/colors.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_step_one_form.dart';

class SignUpStepOnePage extends StatelessWidget {
  const SignUpStepOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: BlocProvider(
        create: (context) => getIt<SignUpStepOneBloc>(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: SignUpStepOneForm(),
          ),
        ),
      ),
    );
  }
}
