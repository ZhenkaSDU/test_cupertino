import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:test_cupertino/core/common/api_links/urls.dart';

Future<http.Response> authorize(String email, String password) {
  return http.post(
    Uri.parse(loginAPI),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "email": email,
      "password": password
    }),
  );
}




