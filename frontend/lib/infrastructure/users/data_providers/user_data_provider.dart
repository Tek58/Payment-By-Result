import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import './../models/models.dart';

// Localhost in ios emulator 127.0.0.1 or localhost
// Localhost in android emulator 10.0.2.2
// Localhost in real devices currentIpaddress/api/v1 ....

class UsersDataProvider {
  // A function that converts a response body in a List
  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static final String _baseUrl = "http://localhost:3000/api/v1/users";
  var logger = Logger();

  Future<User> create(User user, String url) async {
    url = formater(url);
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode({
          "name": user.name,
          "password": user.password,
          "dateOfBirth": user.dateOfBirth,
          "phoneNumber": user.phoneNumber
        }));

    if (response.statusCode == 201) {
      logger.i(response.statusCode);
      logger.i(response.body);
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<User> login(User user, String url) async {
    url = formater(url);
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.name,
          "password": user.password,
        }));

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create course");
    }
  }

  Future<User> fetchById(String url) async {
    url = formater(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(User.fromJson(responseData));
      return User.fromJson(responseData);
    } else {
      throw Exception("Fetching User by Id failed");
    }
  }

  Future<User> search() async {
    String url = formater("/search/user");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('object');
      print(jsonDecode(response.body));
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("searching user by name failed");
    }
  }

  Future<List<User>> fetchAll() async {
    // List<User> users = [];
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      // users = jsonDecode(response.body);
      return compute(parseUsers, response.body);


      // logger.i("hhhddd");
      // logger.i((response.body));
      // return User.fromJson(users);
      // return parseUsers(response.body);

      // final responseData = jsonDecode(response.body) as List;
      // users = responseData.map((e) => User.fromJson(e)).toList();
      // logger.i(users);
      // return users;
    } else {
      throw Exception("Could not fetch users");
    }
  }

  // Future<User> fetchAll() async {
  //   final response = await http.get(Uri.parse(_baseUrl));
  //   if (response.statusCode == 200) {
  //     print('hey');
  //     final users = jsonDecode(response.body);
  //     // logger.i([0]("users")["name"]);
  //     logger.i((response.body));
  //     return User.fromJson(users);
  //     // return parseUsers(response.body);

  //     // final user = jsonDecode(response.body) as List;
  //     // logger.i(user);
  //     // return user.map((c) => User.fromJson(c)).toList();
  //   } else {
  //     throw Exception("Could not fetch users");
  //   }
  // }

  Future<User> updatePassword(String url, User user) async {
    url = formater(url);
    final response = await http.patch(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": user.id,
          "password": user.password,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> deactivate(String url) async {
    url = formater(url);
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the course");
    }
  }

  String formater(String url) {
    return _baseUrl + url;
  }
}
