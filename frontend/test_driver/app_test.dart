import 'package:dartz/dartz.dart';
import 'package:frontend/domain/core/failures.dart';
import 'package:frontend/domain/core/value_validators.dart';
import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';
import '../lib/domain/core/value_validators.dart';

void main() {
  group("App", () {
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test("Test 1", () {
      
    });
  });
}