import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/core/profile_page.dart';
import 'package:frontend/presentation/sign_in/sign_in_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "valid auth user",
    (WidgetTester tester) async {
      await tester.pumpWidget(SignInPage());

      final inputEmail = "test@test.com";
      final inputPassword = "testPassword";

      await tester.enterText(find.byKey(Key("Email")), inputEmail);
      await tester.enterText(find.byKey(Key("Password")), inputPassword);

      await tester.tap(find.byKey(Key("Login")));
      await tester.pumpAndSettle();

      expect(find.byType(SignInPage), findsNothing);
      expect(find.byType(ProfilePage), findsOneWidget);
    },
  );


  
}
