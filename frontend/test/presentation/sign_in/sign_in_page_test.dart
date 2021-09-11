import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/sign_in/sign_in_page.dart';
import 'package:frontend/presentation/sign_in/widgets/sign_in_form.dart';

void main() {
  testWidgets('sign in page ...', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SignInPage()));

    final signInForm = find.byType(SignInForm);

    expect(signInForm, findsOneWidget);
  });
}