import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/core/profile_page.dart';
import 'package:frontend/presentation/sign_in/sign_in_page.dart';
import 'package:frontend/presentation/sign_up/sign_up_new_to_system_page.dart';
import 'package:frontend/presentation/sign_up/sign_up_step_one_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "new  user signup",
    (WidgetTester tester) async {
      await tester.pumpWidget(SignUpStepOnePage());

      final inputEmail = "test1@test.com";

      await tester.enterText(find.byKey(Key("Email")), inputEmail);

      await tester.tap(find.byKey(Key("signup")));
      await tester.pumpAndSettle();

      expect(find.byType(SignUpStepOnePage), findsNothing);
      expect(find.byType(SignUpForNewToSystemPage), findsOneWidget);

      final inmptname = "testNAme";
      final inputDateTime = "10-10-2021";
      final inputPhoneNumber = "+251236478945";
      final inputPassword = "testPassword";
      await tester.enterText(find.byKey(Key("Name")), inmptname);
      await tester.enterText(find.byKey(Key("DateOfBirth")), inputDateTime);
      await tester.enterText(find.byKey(Key("PhoneNumber")), inputPhoneNumber);
      await tester.enterText(find.byKey(Key("Password")), inputPassword);

      await tester.tap(find.byKey(Key("submit")));
      await tester.pumpAndSettle();

      expect(find.byType(SignInPage), findsNothing);
      expect(find.byType(ProfilePage), findsOneWidget);
    },
  );
}
