import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/sign_up/sign_up_step_one_page.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_step_one_form.dart';

void main() {
  testWidgets('sign up step one page ...', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SignUpStepOnePage()));

    expect(find.byKey(Key("SignUpStepOneForm")), findsOneWidget);
  });
}