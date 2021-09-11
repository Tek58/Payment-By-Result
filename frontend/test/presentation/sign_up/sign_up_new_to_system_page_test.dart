import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/sign_up/sign_up_new_to_system_page.dart';
import 'package:frontend/presentation/sign_up/widgets/sign_up_new_to_system_form.dart';

void main() {
  testWidgets('sign up new to system page ...', (tester) async {
    await tester.pumpWidget(MaterialApp(home:SignUpForNewToSystemPage()));

    expect(find.byKey(Key("SignUpForNewToSystemForm")), findsOneWidget);
  });
}