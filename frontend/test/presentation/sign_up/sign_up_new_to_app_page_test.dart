import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/sign_up/sign_up_new_to_app_page.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_new_to_app_form.dart';

void main() {
  testWidgets('sign up new to app page ...', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SignUpForNewToAppPage()));

    expect(find.byKey(Key("SignUpForNewToAppForm")), findsOneWidget);
  });
}