import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import './../models/intervention.dart';

class InterventionsDataProvider {
  // A function that converts a response body in a List
  List<Intervention> parseInterventions(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<Intervention>((json) => Intervention.fromJson(json))
        .toList();
  }

  static final String _baseUrl = "http://localhost:3000/api/v1/interventions";
  var logger = Logger();

  Future<Intervention> create(Intervention intervention, int cptCode) async {
    final http.Response response = await http.post(Uri.parse("$_baseUrl/$cptCode"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode({
          "cptCode": intervention.cptCode,
          "description": intervention.description,
          "price": intervention.price
        }));

    if (response.statusCode == 201) {
      logger.i(response.statusCode);
      logger.i(response.body);
      return Intervention.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<Intervention> fetchBycptCode(int cptCode) async {
    final response = await http.get(Uri.parse("$_baseUrl/$cptCode"));

    if (response.statusCode == 200) {
      print('object');
      print(jsonDecode(response.body));
      return Intervention.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching intervention by cptCode failed");
    }
  }

  Future<List<Intervention>> fetchAll() async {
    // List<Intervention> interventions = [];
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return compute(parseInterventions, response.body);

      // final responceData = response.body as List;
      // logger.i(responceData);
      // interventions = responceData.map((e) => Intervention.fromJson(e)).toList();
      // return interventions;


      

      // final interventions = jsonDecode(response.body);
      // logger.i((response.body));
      // return Intervention.fromJson(interventions);

      // return parseUsers(response.body);
      // final user = jsonDecode(response.body) as List;
      // logger.i(user);
      // return user.map((c) => User.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch interventions");
    }
  }

  Future<Intervention> update(int cptCode, Intervention intervention) async {
    final response = await http.patch(Uri.parse("$_baseUrl/$cptCode"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "cptCode": intervention.cptCode,
          "description": intervention.description,
          "price": intervention.price
        }));

    if (response.statusCode == 200) {
      return Intervention.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the intervention");
    }
  }

  Future<void> delete(int cptCode) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$cptCode"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the intervention");
    }
  }

  String formater(String url) {
    return _baseUrl + url;
  }

}
