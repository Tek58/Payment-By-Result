import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import './../models/sign_up.dart';
import './../models/sign_in.dart';

// Localhost in ios emulator 127.0.0.1 or localhost
// Localhost in android emulator 10.0.2.2
// Localhost in real devices currentIpaddress/api/v1 ....

class AuthDataProvider {
  // A function that converts a response body in a List
  List<SignUp> parseSignUps(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<SignUp>((json) => SignUp.fromJson(json)).toList();
  }

  // FlutterSecureStorage storage = FlutterSecureStorage();
  static final String _baseUrl = "http://localhost:3000/api/v1/auth";
  var logger = Logger();

  Future<SignUp> register(SignUp user, String url) async {
    // String? token = await storage.read(key: "token");
    url = formater(url);
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Authorization": "Bearer token"
        },
        body: jsonEncode(user));

    if (response.statusCode == 200 || response.statusCode == 201) {
      logger.i(response.statusCode);
      logger.i(response.body);
      return SignUp.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<String> emailRegistered(String email) async {
    // String? token = await storage.read(key: "token");
    String url = formater("/exist/register");
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode({"email": email}));

    if (response.statusCode == 400) {
      // bad not provided
      logger.i(response.statusCode);
      logger.i(response.body);
      return jsonDecode(response.body);

    } else if (response.statusCode == 404) {
      // email not found
      logger.i(response.statusCode);
      logger.i(response.body);
      return jsonDecode(response.body);
    } else if (response.statusCode == 409) {
      // email and password both exist: already registered
      logger.i(response.statusCode);
      logger.i(response.body);
      return jsonDecode(response.body);

    } else if (response.statusCode == 200) {
      // email registered but not password: CONTINUE
      logger.i(response.statusCode);
      logger.i(response.body);
      return jsonDecode(response.body);
    }
    {
      throw Exception("Failed to check email");
    }
  }

  Future<SignIn> login(SignIn user, String url) async {
    // String? token = await storage.read(key: "token");
    url = formater(url);
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer token"
        },
        body: jsonEncode({
          "email": user.name,
          "password": user.password,
        }));

    if (response.statusCode == 201) {
      return SignIn.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to signin");
    }
  }

  String formater(String url) {
    return _baseUrl + url;
  }
}
