import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/domain/auth/value_objects.dart';
import 'package:frontend/presentation/core/widgets/cta_button.dart';
import 'package:frontend/presentation/core/widgets/record_card.dart';
import 'package:frontend/presentation/doctors/doctors_home_page.dart';
import 'package:frontend/presentation/doctors/patient_detail_page.dart';
import 'package:frontend/presentation/patients/patients_home_page.dart';
import 'package:frontend/presentation/sign_in/sign_in_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("valid auth doctor", (WidgetTester tester) async {
    await tester.pumpWidget(SignInPage());

    final inputEmail = "test@test.com";
    final inputPassword = "testPassword";

    await tester.enterText(find.byKey(Key("Email")), inputEmail);
    await tester.enterText(find.byKey(Key("Password")), inputPassword);

    await tester.tap(find.byKey(Key("Login")));
    await tester.pumpAndSettle();

    expect(find.byType(SignInPage), findsNothing);
    expect(find.byType(DoctorsHomePage), findsOneWidget);
    expect(find.byKey(Key("myPaitents")), findsOneWidget);

    await tester.tap(find.byKey(Key("recents")));
    await tester.pumpAndSettle();

    expect(find.byType(RecordCard), findsOneWidget);

    await tester.tap(find.byKey(Key("recentUser")).first);
    await tester.pumpAndSettle();

    expect(find.byType(PatientDetailPage), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
  });
}