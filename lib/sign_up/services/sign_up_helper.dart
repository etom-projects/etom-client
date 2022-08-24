import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kurly_hackerton/utils/request_url.dart';
import 'package:kurly_hackerton/utils/token.dart';

class SignUpHelper {
  static Future<int> signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber
  }) async {
    var url = Uri.parse(signUpUrl);

    String body = """{
      "email" : "$email",
      "password" : "$password",
      "name" : "$name",
      "phoneNumber" : "$phoneNumber"
    }""";

    print(body);

    Map<String, String> header = {
      "Content-Type" : "application/json"
    };

    var response = await http.post(url, headers: header, body: body);
    return response.statusCode;
  }

  static Future<dynamic> signIn({
    required String email,
    required String password
  }) async {
    var url = Uri.parse(signInUrl);

    String body = """{
      "email" : "$email",
      "password" : "$password"
    }""";

    print(body);
    Map<String, String> header = {
      "Content-Type" : "application/json"
    };

    var response = await http.post(url, headers: header, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  static Future<int> selectJobType(int jobType) async {
    var url = Uri.parse(selectJobTypeUrl);
    print(url);
    String body = """{
      "jobTypeId" : $jobType
    }""";

    Map<String, String> header = {
      "Authorization" : "Bearer $userToken",
      "Content-Type" : "application/json"
    };

    print(body);
    print(header);

    var response = await http.post(url, headers: header, body: body);
    return response.statusCode;
  }

}